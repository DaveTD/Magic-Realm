require 'active_support/concern'

module ChitsetCreator
  extend ActiveSupport::Concern

    def make_chits
    #self.id should be the game's id
    gold_chit_seed = [
      {game_id: self.id, site_name: 'Altar', tile_clearing_number: 1},
      {game_id: self.id, site_name: 'Statue', tile_clearing_number: 2},
      {game_id: self.id, site_name: 'Lair', tile_clearing_number: 3},
      {game_id: self.id, site_name: 'Vault', tile_clearing_number: 3},
      {game_id: self.id, site_name: 'Shrine', tile_clearing_number: 4},
      {game_id: self.id, site_name: 'Cairns', tile_clearing_number: 5},
      {game_id: self.id, site_name: 'Hoard', tile_clearing_number: 6},
      {game_id: self.id, site_name: 'Pool', tile_clearing_number: 6}]

    gold_chit_seed.each do |sc|
      GoldSite.create(game_id: sc[:game_id], lost_city: false, lost_castle: false, site_name: sc[:site_name], tile_clearing_number: sc[:tile_clearing_number])
    end

    ## Sound Chits
    sound_chit_seed = [
      {game_id: self.id, name: 'Flutter', tile_clearing_number: 1},
      {game_id: self.id, name: 'Flutter', tile_clearing_number: 2},
      {game_id: self.id, name: 'Howl', tile_clearing_number: 4},
      {game_id: self.id, name: 'Howl', tile_clearing_number: 5},
      {game_id: self.id, name: 'Patter', tile_clearing_number: 2},
      {game_id: self.id, name: 'Patter', tile_clearing_number: 5},
      {game_id: self.id, name: 'Roar', tile_clearing_number: 4},
      {game_id: self.id, name: 'Roar', tile_clearing_number: 6},
      {game_id: self.id, name: 'Slither', tile_clearing_number: 3},
      {game_id: self.id, name: 'Slither', tile_clearing_number: 6}
    ]

    ## Warning Chits
    warning_chit_seed = [
      {game_id: self.id, name: 'Bones', letter: 'C'},
      {game_id: self.id, name: 'Bones', letter: 'M'},
      {game_id: self.id, name: 'Bones', letter: 'V'},
      {game_id: self.id, name: 'Bones', letter: 'W'},
      {game_id: self.id, name: 'Dank', letter: 'C'},
      {game_id: self.id, name: 'Dank', letter: 'M'},
      {game_id: self.id, name: 'Dank', letter: 'V'},
      {game_id: self.id, name: 'Dank', letter: 'W'},
      {game_id: self.id, name: 'Ruins', letter: 'C'},
      {game_id: self.id, name: 'Ruins', letter: 'M'},
      {game_id: self.id, name: 'Ruins', letter: 'V'},
      {game_id: self.id, name: 'Ruins', letter: 'W'},
      {game_id: self.id, name: 'Stink', letter: 'C'},
      {game_id: self.id, name: 'Stink', letter: 'M'},
      {game_id: self.id, name: 'Stink', letter: 'V'},
      {game_id: self.id, name: 'Stink', letter: 'W'},
      {game_id: self.id, name: 'Smoke', letter: 'C'},
      {game_id: self.id, name: 'Smoke', letter: 'M'},
      {game_id: self.id, name: 'Smoke', letter: 'V'},
      {game_id: self.id, name: 'Smoke', letter: 'W'}
    ]

    ## Treasures Chits large, spell type, fame_value, great, fame_price_number, enchanted, weight, noteriety_value, price, metatreasure, movable
    treasures_chit_seed = [
      { game_id: self.id, name: '7-League Boots', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 2, price: 5, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Alchemist\'s Mixture', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 4, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Amulet', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 5, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Ancient Telescope', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 5, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Battle Bracelets', large: true, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 4, price: 5, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Beast Pipes', large: false, spell_type: nil, fame_value: -5, great: false, fame_price_number: 0, weight: nil, notoriety_value: 5, price: 12, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Bejeweled Dwarf Vest', large: true, spell_type: nil, fame_value: 0, great: true, fame_price_number: 10, weight: "M", notoriety_value: 5, price: 27, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Belt of Strength', large: true, spell_type: nil, fame_value: 3, great: false, fame_price_number: 0, weight: nil, notoriety_value: 6, price: 16, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Black Book', large: false, spell_type: nil, fame_value: -15, great: true, fame_price_number: 0, weight: "L", notoriety_value: 15, price: 10, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Blasted Jewel', large: true, spell_type: nil, fame_value: -15, great: true, fame_price_number: 0, weight: "H", notoriety_value: 15, price: 30, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Book of Lore', large: false, spell_type: nil, fame_value: -5, great: false, fame_price_number: 0, weight: "L", notoriety_value: 10, price: 10, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Chest', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: "T", notoriety_value: 0, price: 0, metatreasure: true, movable: true, player_id: nil },
      { game_id: self.id, name: 'Cloak of Mist', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 2, price: 4, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Cloven Hoof', large: false, spell_type: "Black", fame_value: -20, great: true, fame_price_number: 0, weight: nil, notoriety_value: 40, price: 4, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Crypt of the Knight', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: "N/A", notoriety_value: 0, price: 0, metatreasure: true, movable: false, player_id: nil },
      { game_id: self.id, name: 'Crystal Ball', large: true, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: "M", notoriety_value: 5, price: 20, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Deft Gloves', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 5, weight: nil, notoriety_value: 6, price: 10, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Dragon Essence', large: false, spell_type: "Purple", fame_value: -10, great: true, fame_price_number: 0, weight: nil, notoriety_value: 20, price: 3, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Dragonfang Necklace', large: false, spell_type: nil, fame_value: 0, great: true, fame_price_number: 12, weight: nil, notoriety_value: 12, price: 8, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Draught of Speed', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 6, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Elusive Cloak', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 2, price: 10, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Elven Slippers', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 2, price: 5, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Enchanted Meadow', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: "N/A", notoriety_value: 0, price: 0, metatreasure: true, movable: false, player_id: nil },
      { game_id: self.id, name: 'Enchanter\'s Skull', large: true, spell_type: nil, fame_value: -10, great: true, fame_price_number: 0, weight: "L", notoriety_value: 10, price: 17, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Eye of the Idol', large: true, spell_type: nil, fame_value: -5, great: false, fame_price_number: 0, weight: "M", notoriety_value: 10, price: 34, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Eye of the Moon', large: true, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: "M", notoriety_value: 13, price: 13, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Flowers of Rest', large: false, spell_type: "Gold", fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 2, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Flying Carpet', large: true, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: "M", notoriety_value: 12, price: 17, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Garb of Speed', large: true, spell_type: nil, fame_value: 2, great: false, fame_price_number: 0, weight: nil, notoriety_value: 6, price: 16, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Girtle of Energy', large: true, spell_type: nil, fame_value: 2, great: false, fame_price_number: 0, weight: nil, notoriety_value: 4, price: 13, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Glimmering Ring', large: true, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 10, price: 15, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Gloves of Strength', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 5, weight: nil, notoriety_value: 6, price: 8, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Glowing Gem', large: true, spell_type: nil, fame_value: 0, great: false, fame_price_number: 5, weight: nil, notoriety_value: 5, price: 15, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Golden Arm Band', large: true, spell_type: nil, fame_value: 0, great: false, fame_price_number: 3, weight: "L", notoriety_value: 0, price: 15, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Golden Crown', large: true, spell_type: nil, fame_value: 0, great: true, fame_price_number: 20, weight: "H", notoriety_value: -15, price: 50, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Golden Icon', large: true, spell_type: "Grey", fame_value: 0, great: true, fame_price_number: -10, weight: "T", notoriety_value: 20, price: 100, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Good Book', large: false, spell_type: nil, fame_value: 5, great: false, fame_price_number: 0, weight: "L", notoriety_value: 5, price: 10, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Gripping Dust', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 3, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Handy Gloves', large: false, spell_type: nil, fame_value: 1, great: false, fame_price_number: 0, weight: nil, notoriety_value: 2, price: 6, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Hidden Ring', large: true, spell_type: nil, fame_value: -10, great: true, fame_price_number: 0, weight: nil, notoriety_value: 10, price: 20, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Imperial Tabard', large: true, spell_type: nil, fame_value: 0, great: true, fame_price_number: 20, weight: "M", notoriety_value: -10, price: 17, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Lost Keys', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 5, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Lucky Charm', large: true, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 14, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Magic Spectacles', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 2, price: 6, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Magic Wand', large: true, spell_type: nil, fame_value: -10, great: true, fame_price_number: 0, weight: nil, notoriety_value: 10, price: 17, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Map of Lost Castle', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 3, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Map of Lost City', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 3, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Map of Ruins', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 3, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Mouldy Skeleton', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: "N/A", notoriety_value: 0, price: 0, metatreasure: true, movable: false, player_id: nil },
      { game_id: self.id, name: 'Oil of Poison', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 3, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Ointment of Bite', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 5, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Ointment of Steel', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 4, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Penetrating Grease', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 0, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Phantom Glass', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: "L", notoriety_value: 2, price: 8, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Potion of Energy', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 5, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Poultice of Health', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 2, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Power Boots', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 3, price: 8, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Power Gauntlets', large: false, spell_type: nil, fame_value: 3, great: false, fame_price_number: 0, weight: nil, notoriety_value: 4, price: 7, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Quick Boots', large: false, spell_type: nil, fame_value: 1, great: false, fame_price_number: 0, weight: nil, notoriety_value: 2, price: 8, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Reflecting Grease', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 3, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Regent of Jewels', large: true, spell_type: nil, fame_value: 0, great: true, fame_price_number: 10, weight: "L", notoriety_value: 10, price: 67, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Remains of the Theif', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: "N/A", notoriety_value: 0, price: 0, metatreasure: true, movable: true, player_id: nil },
      { game_id: self.id, name: 'Royal Sceptre', large: false, spell_type: nil, fame_value: 0, great: true, fame_price_number: 20, weight: "L", notoriety_value: -15, price: 8, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Sacred Grail', large: true, spell_type: "White", fame_value: 0, great: true, fame_price_number: 50, weight: "M", notoriety_value: -25, price: 12, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Sacred Statue', large: false, spell_type: nil, fame_value: 0, great: true, fame_price_number: 10, weight: "L", notoriety_value: -5, price: 10, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Scroll of Alchemy', large: false, spell_type: nil, fame_value: -10, great: true, fame_price_number: 0, weight: "L", notoriety_value: 15, price: 10, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Scroll of Nature', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: "L", notoriety_value: 5, price: 10, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Shielded Lantern', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: "L", notoriety_value: 0, price: 8, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Shoes of Stealth', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 2, price: 7, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Timeless Jewel', large: true, spell_type: nil, fame_value: 0, great: false, fame_price_number: 5, weight: "L", notoriety_value: 7, price: 34, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Toadstool Circle', large: false, spell_type: "Black", fame_value: 0, great: false, fame_price_number: 0, weight: "N/A", notoriety_value: 0, price: 0, metatreasure: true, movable: false, player_id: nil },
      { game_id: self.id, name: 'Toadstool Ring', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 3, price: 9, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Vial of Healing', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 2, metatreasure: false, movable: true, player_id: nil },
      { game_id: self.id, name: 'Withered Claw', large: false, spell_type: nil, fame_value: 0, great: false, fame_price_number: 0, weight: nil, notoriety_value: 0, price: 3, metatreasure: false, movable: true, player_id: nil }

    ]

    treasures_chit_seed.each do |tc|
      Treasure.create(game_id: tc[:game_id], name: tc[:name], large: tc[:large], spell_type: tc[:spell_type], fame_value: tc[:fame_value], great: tc[:great], fame_price_number: tc[:fame_price_number], weight: tc[:weight], notoriety_value: tc[:notoriety_value], price: tc[:price], metatreasure: tc[:metatreasure], movable: tc[:movable])
    end


    sound_chit_seed.each do |sc|
      SoundChit.create(game_id: sc[:game_id], lost_city: false, lost_castle: false, name: sc[:name], tile_clearing_number: sc[:tile_clearing_number])
    end

    warning_chit_seed.each do |wc|
      WarningChit.create(game_id: wc[:game_id], name: wc[:name], letter: wc[:letter])
    end

    SpecialChit.create(game_id: self.id, name: 'Lost City')
    SpecialChit.create(game_id: self.id, name: 'Lost Castle')

    ## Monsters
    Monster.create(game_id: self.id, monster: 'Ghosts', damage_type: 1, attack_time: 2, maneuver_time: 2, vulnerability: 2, attacks: 1,
            clearing_id: 12, prowling: false, blocked: false)

  end
end
