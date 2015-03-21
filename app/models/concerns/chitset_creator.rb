module ChitSetup
  extend ActiveRecord::Concern

  #self.id should be the game's id
  gold_chit_seed = [
    {game_id: self.id, name: 'Altar', tile_clearing_number: 1},
    {game_id: self.id, name: 'Statue', tile_clearing_number: 2},
    {game_id: self.id, name: 'Lair', tile_clearing_number: 3},
    {game_id: self.id, name: 'Vault', tile_clearing_number: 3},
    {game_id: self.id, name: 'Shrine', tile_clearing_number: 4},
    {game_id: self.id, name: 'Cairns', tile_clearing_number: 5},
    {game_id: self.id, name: 'Hoard', tile_clearing_number: 6},
    {game_id: self.id, name: 'Pool', tile_clearing_number: 6}]

  gold_chit_seed.each do |sc|
    GoldSite.create(game_id: sc[:game_id], lost_city: false, lost_castle: false, name: sc[:name], tile_clearing_number: sc[:tile_clearing_number])
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

  sound_chit_seed.each do |sc|
    SoundChit.create(game_id: sc[:game_id], lost_city: false, lost_castle: false, name: sc[:name], tile_clearing_number: sc[:tile_clearing_number])
  end

  SpecialChit.create(game_id: self.id, name: 'Lost City')
  SpecialChit.create(game_id: self.id, name: 'Lost Castle')

  ## Monsters
  Monster.create(game_id: self.id, monster: 'Ghosts', damage_type: 1, attack_time: 2, maneuver_time: 2, vulnerability: 2, attacks: 1,
          clearing_id: 12, prowling: false, blocked: false)

end
