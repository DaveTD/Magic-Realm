require 'active_support/concern'

module ChitSetup
  extend ActiveSupport::Concern

  def sample! source_set, number, target_set = []
    small_set = source_set.sample(number)
    return (source_set - small_set), (target_set << small_set).flatten
  end

  def map_to_internal_clearing chit, tile
    clearing = Clearing.where(tile_id: tile).where(clearing_number: chit.tile_clearing_number).first
    clearing ||= Clearing.where(tile_id: tile).where(clearing_number: 4).first
    return clearing.id
  end

  def pile_setter chit, lostcity, lostcastle, tile, clearing
    chit.lost_city = lostcity
    chit.lost_castle = lostcastle
    chit.tile_id = tile
    if clearing != nil
      chit.clearing_id = clearing
    else
      chit.clearing_id = nil
    end
    chit.save
  end

  def warning_chit_setup
    mountain_warning_chits = WarningChit.where(game_id: self.id).where(letter: 'M')
    mountain_warning_chits.shuffle
    valley_warning_chits = WarningChit.where(game_id: self.id).where(letter: 'V')
    valley_warning_chits.shuffle
    cave_warning_chits = WarningChit.where(game_id: self.id).where(letter: 'C')
    cave_warning_chits.shuffle
    woods_warning_chits = WarningChit.where(game_id: self.id).where(letter: 'W')
    woods_warning_chits.shuffle

    mountain_ids = Tile.where(tile_type: 'mountain').pluck(:id)
    valley_ids = Tile.where(tile_type: 'valley').pluck(:id)
    cave_ids = Tile.where(tile_type: 'cave').pluck(:id)
    wood_ids = Tile.where(tile_type: 'woods').pluck(:id)

    mountain_warning_chits.each do |mountain|
      mountain.tile_id = mountain_ids.shift
      mountain.save
    end

    valley_warning_chits.each do |valley|
      valley.tile_id = valley_ids.shift
      valley.save
    end

    cave_warning_chits.each do |cave|
      cave.tile_id = cave_ids.shift
      cave.save
    end

    woods_warning_chits.each do |wood|
      wood.tile_id = wood_ids.shift
      wood.save
    end
  end

  def lost_c_setup
    all_cave_tiles_ids = Tile.where(tile_type: 'cave').pluck(:id)
    all_mountain_tiles_ids = Tile.where(tile_type: 'mountain').pluck(:id)

    all_sound_chits = SoundChit.where(game_id: self.id)
    all_map_treasure_site_chits = GoldSite.where(game_id: self.id)
    lost_city_chit = SpecialChit.where(game_id: self.id).where(name: 'Lost City').first
    lost_castle_chit = SpecialChit.where(game_id: self.id).where(name: 'Lost Castle').first

    chit_mixer = all_sound_chits + all_map_treasure_site_chits
    chit_mixer, lost_city_pile = sample!(chit_mixer, 5)
    chit_mixer, lost_castle_pile = sample!(chit_mixer, 5)

    chit_mixer, cave_tile_set = sample!(chit_mixer, 4)
    chit_mixer, mountain_tile_set = sample!(chit_mixer, 4)

    lost_city_pile = lost_city_pile.shuffle
    lost_castle_pile = lost_castle_pile.shuffle

    mountain_tile_set = mountain_tile_set.shuffle
    cave_tile_set = cave_tile_set.shuffle

    lost_castle_chit.tile_id = all_mountain_tiles_ids.shift
    lost_castle_chit.save

    lost_city_chit.tile_id = all_cave_tiles_ids.shift
    lost_city_chit.save

    lost_city_pile.each do |chit|
      pile_setter(chit, true, false, nil, map_to_internal_clearing(chit, lost_city_chit.tile_id))
    end

    lost_castle_pile.each do |chit|
      pile_setter(chit, false, true, nil, map_to_internal_clearing(chit, lost_castle_chit.tile_id))
    end

    mountain_tile_set.each do |chit|
      tile = all_mountain_tiles_ids.shift
      pile_setter(chit, false, false, tile , map_to_internal_clearing(chit, tile))
    end

    cave_tile_set.each do |chit|
      tile = all_cave_tiles_ids.shift
      pile_setter(chit, false, false, tile, map_to_internal_clearing(chit ,tile))
    end
  end

  def treasure_chit_setup

    large_treasures = Treasure.where(large: true)
    meta_treasures = Treasure.where(metatreasure: true)
    small_treasures  = (Treasure.all - large_treasures) - meta_treasures

    large_treasures.shuffle
    meta_treasures.shuffle
    small_treasures.shuffle

    large_treasures, chest_pile = sample!(large_treasures, 2)

    toadstool_pile = large_treasures.shift
    remains_of_theif_pile = large_treasures.shift
    crypt_of_the_knight_pile = large_treasures.shift

    toadstool_pile.pile = "toadstool"
    toadstool_pile.save
    remains_of_theif_pile.pile = "remains_of_theif"
    remains_of_theif_pile.save
    crypt_of_the_knight_pile.pile = "crypt_of_the_knight"
    crypt_of_the_knight_pile.save

    large_treasures, hoard_pile = sample!(large_treasures, 5)
    large_treasures, lair_pile = sample!(large_treasures, 3)
    large_treasures, altar_pile = sample!(large_treasures, 4)
    large_treasures, shrine_pile = sample!(large_treasures, 2)
    large_treasures, pool_pile = sample!(large_treasures, 3)
    large_treasures, vault_pile = sample!(large_treasures, 5)
    large_treasures, statue_pile = sample!(large_treasures, 3)
    large_treasures, cairns_pile = sample!(large_treasures, 1)
    company_pile = []
    woodfolk_pile = []
    patrol_pile = []
    lancers_pile = []
    bashkars_pile = []
    chapel_pile = []
    house_pile = []
    inn_pile = []
    guard_house_pile = []
    scholar_pile = []

    small_treasures, hoard_pile = sample!(small_treasures, 4, hoard_pile)
    small_treasures, lair_pile = sample!(small_treasures, 4, lair_pile)
    small_treasures, shrine_pile = sample!(small_treasures, 2, shrine_pile)
    small_treasures, pool_pile = sample!(small_treasures, 6, pool_pile)
    small_treasures, cairns_pile = sample!(small_treasures, 6, cairns_pile)
    small_treasures, statue_pile = sample!(small_treasures, 2, statue_pile)
    small_treasures, company_pile = sample!(small_treasures, 2, company_pile)
    small_treasures, woodfolk_pile = sample!(small_treasures, 2, woodfolk_pile)
    small_treasures, patrol_pile = sample!(small_treasures, 2, patrol_pile)
    small_treasures, lancers_pile = sample!(small_treasures, 2, lancers_pile)
    small_treasures, bashkars_pile = sample!(small_treasures, 2, bashkars_pile)
    small_treasures, chapel_pile = sample!(small_treasures, 2, chapel_pile)
    small_treasures, house_pile = sample!(small_treasures, 2, house_pile)
    small_treasures, inn_pile = sample!(small_treasures, 2, inn_pile)
    small_treasures, guard_house_pile = sample!(small_treasures, 2, guard_house_pile)
    small_treasures, scholar_pile = sample!(small_treasures, 3, scholar_pile)

    chest_pile.each do |c|
      c.pile = "chest"
      c.save
    end

    hoard_pile.each do |c|
      c.pile = "hoard"
      c.save
    end

    lair_pile.each do |c|
      c.pile = "lair"
      c.save
    end

    shrine_pile.each do |c|
      c.pile = "shrine"
      c.save
    end

    pool_pile.each do |c|
      c.pile = "pool"
      c.save
    end

    cairns_pile.each do |c|
      c.pile = "cairns"
      c.save
    end

    statue_pile.each do |c|
      c.pile = "statue"
      c.save
    end

    company_pile.each do |c|
      c.pile = "company"
      c.save
    end

    woodfolk_pile.each do |c|
      c.pile = "woodfolk"
      c.save
    end

    patrol_pile.each do |c|
      c.pile = "patrol"
      c.save
    end

    lancers_pile.each do |c|
      c.pile = "lancers"
      c.save
    end

    bashkars_pile.each do |c|
      c.pile = "bashkars"
      c.save
    end

    chapel_pile.each do |c|
      c.pile = "chapel"
      c.save
    end

    house_pile.each do |c|
      c.pile = "house"
      c.save
    end

    inn_pile.each do |c|
      c.pile = "inn"
      c.save
    end

    guard_house_pile.each do |c|
      c.pile = "guard_house"
      c.save
    end

    scholar_pile.each do |c|
      c.pile = "scholar"
      c.save
    end
  end

end
