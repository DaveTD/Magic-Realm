
game2 = Game.create(turn: 1, prowling_row: 0)

Player.create(wounds: 0, fatigue: 0, game_id: game2.id, first_name: 'Joe', last_name: 'Blow', character_class_id: 2, clearing_id: 2)
Player.create(wounds: 0, fatigue: 0, game_id: game2.id, first_name: 'Jim', last_name: 'Blow', character_class_id: 4, clearing_id: 2)
game2.players_ready!


Monster.create(monster: 'wolf', vulnerability: 2, wounds: 0, fatigue: 0, clearing_id: 2, game_id: game.id)
Monster.create(monster: 'wolf', vulnerability: 2, wounds: 0, fatigue: 0, clearing_id: 2, game_id: game.id)
Monster.create(monster: 'wolf', vulnerability: 2, wounds: 0, fatigue: 0, clearing_id: 2, game_id: game.id)
Monster.create(monster: 'wolf', vulnerability: 2, wounds: 0, fatigue: 0, clearing_id: 2, game_id: game.id)
Monster.create(monster: 'wolf', vulnerability: 2, wounds: 0, fatigue: 0, clearing_id: 2, game_id: game.id)

