# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150223024233) do

  create_table "action_chits", force: :cascade do |t|
    t.integer  "player_id"
    t.string   "chit_type"
    t.integer  "strength"
    t.integer  "damage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "action_chits", ["player_id"], name: "index_action_chits_on_player_id"

  create_table "action_queues", force: :cascade do |t|
    t.integer  "player_id"
    t.string   "action_name"
    t.integer  "value"
    t.integer  "turn"
    t.integer  "action_this_turn"
    t.integer  "action_chit_id"
    t.integer  "clearing_id"
    t.boolean  "completed"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "action_queues", ["action_chit_id"], name: "index_action_queues_on_action_chit_id"
  add_index "action_queues", ["clearing_id"], name: "index_action_queues_on_clearing_id"
  add_index "action_queues", ["player_id"], name: "index_action_queues_on_player_id"

  create_table "adjacent_tiles", force: :cascade do |t|
    t.integer "tile_id"
    t.integer "next_tile_id"
    t.string  "location"
  end

  create_table "armors", force: :cascade do |t|
    t.string   "armor_name"
    t.string   "armor_type"
    t.boolean  "protect_thrust"
    t.boolean  "protect_swing"
    t.boolean  "protect_smash"
    t.boolean  "tremendous"
    t.integer  "price_intact"
    t.integer  "price_damaged"
    t.integer  "price_destroyed"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "character_classes", force: :cascade do |t|
    t.string   "name"
    t.integer  "vulnerability"
    t.integer  "movement_cost"
    t.integer  "cave_movement_cost"
    t.integer  "mountain_movement_cost"
    t.integer  "ally_id"
    t.integer  "friendly_id"
    t.integer  "unfriendly_id"
    t.integer  "enemy_id"
    t.integer  "development_chits_id"
    t.integer  "starting_weapon_id"
    t.integer  "starting_shield_id"
    t.integer  "starting_helmet_id"
    t.integer  "starting_breastplate_id"
    t.integer  "starting_suit_id"
    t.text     "special_advantages"
    t.integer  "starts_in"
    t.integer  "starting_gold"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "character_classes", ["ally_id"], name: "index_character_classes_on_ally_id"
  add_index "character_classes", ["development_chits_id"], name: "index_character_classes_on_development_chits_id"
  add_index "character_classes", ["enemy_id"], name: "index_character_classes_on_enemy_id"
  add_index "character_classes", ["friendly_id"], name: "index_character_classes_on_friendly_id"
  add_index "character_classes", ["unfriendly_id"], name: "index_character_classes_on_unfriendly_id"

  create_table "clearings", force: :cascade do |t|
    t.integer "x"
    t.integer "y"
    t.boolean "exit"
    t.string  "movement_type"
    t.integer "movement_value"
    t.integer "clearing_number"
    t.integer "tile_id"
  end

  create_table "discovered_chits_clearings", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.integer  "clearing_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "discovered_chits_clearings", ["clearing_id"], name: "index_discovered_chits_clearings_on_clearing_id"
  add_index "discovered_chits_clearings", ["game_id"], name: "index_discovered_chits_clearings_on_game_id"
  add_index "discovered_chits_clearings", ["player_id"], name: "index_discovered_chits_clearings_on_player_id"

  create_table "found_hidden_passages", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.integer  "clearing_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "found_hidden_passages", ["clearing_id"], name: "index_found_hidden_passages_on_clearing_id"
  add_index "found_hidden_passages", ["game_id"], name: "index_found_hidden_passages_on_game_id"
  add_index "found_hidden_passages", ["player_id"], name: "index_found_hidden_passages_on_player_id"

  create_table "found_hidden_paths", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.integer  "clearing_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "found_hidden_paths", ["clearing_id"], name: "index_found_hidden_paths_on_clearing_id"
  add_index "found_hidden_paths", ["game_id"], name: "index_found_hidden_paths_on_game_id"
  add_index "found_hidden_paths", ["player_id"], name: "index_found_hidden_paths_on_player_id"

  create_table "games", force: :cascade do |t|
    t.string   "time_of_day"
    t.integer  "turn"
    t.integer  "current_players_turn"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gold_sites", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "tile_id"
    t.boolean  "lost_city"
    t.boolean  "lost_castle"
    t.string   "name"
    t.integer  "tile_clearing_number"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "gold_sites", ["game_id"], name: "index_gold_sites_on_game_id"
  add_index "gold_sites", ["tile_id"], name: "index_gold_sites_on_tile_id"

  create_table "horses", force: :cascade do |t|
    t.integer  "move_strength"
    t.boolean  "galloping"
    t.integer  "maneuver_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.string   "monster"
    t.integer  "damage_type"
    t.integer  "attack_time"
    t.integer  "maneuver_time"
    t.integer  "vulnerability"
    t.integer  "attacks"
    t.integer  "clearing_id"
    t.boolean  "prowling"
    t.boolean  "blocked"
    t.string   "monster_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "monsters", ["clearing_id"], name: "index_monsters_on_clearing_id"

  create_table "natives", force: :cascade do |t|
    t.text     "type"
    t.boolean  "hq"
    t.integer  "harm_type"
    t.integer  "attack_time"
    t.boolean  "sharpness"
    t.integer  "maneuver_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.string   "action"
    t.boolean  "private_notification"
    t.integer  "turn"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "notifications", ["game_id"], name: "index_notifications_on_game_id"
  add_index "notifications", ["player_id"], name: "index_notifications_on_player_id"

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "game_id"
    t.integer  "clearing_id"
    t.boolean  "ready"
    t.boolean  "actions_submitted"
    t.integer  "great_treasures_vps"
    t.integer  "usable_spells_vps"
    t.integer  "fame_vps"
    t.integer  "notoriety_vps"
    t.integer  "gold_vps"
    t.integer  "gold"
    t.integer  "fame"
    t.integer  "notoriety"
    t.integer  "action_queue_id"
    t.integer  "weapon_id"
    t.boolean  "weapon_alerted"
    t.integer  "boots_id"
    t.integer  "suit_of_armor_id"
    t.integer  "shield_id"
    t.integer  "helmet_id"
    t.integer  "breast_plate_id"
    t.integer  "horse_id"
    t.integer  "hirelings_id"
    t.boolean  "hidden"
    t.boolean  "found_hidden_enemies"
    t.boolean  "wounded"
    t.boolean  "fatigued"
    t.boolean  "dead"
    t.integer  "curses_id"
    t.integer  "character_class_id"
    t.integer  "level"
    t.integer  "inventory_id"
    t.integer  "between_clearing_1"
    t.integer  "between_clearing_2"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "players", ["action_queue_id"], name: "index_players_on_action_queue_id"
  add_index "players", ["boots_id"], name: "index_players_on_boots_id"
  add_index "players", ["breast_plate_id"], name: "index_players_on_breast_plate_id"
  add_index "players", ["character_class_id"], name: "index_players_on_character_class_id"
  add_index "players", ["clearing_id"], name: "index_players_on_clearing_id"
  add_index "players", ["curses_id"], name: "index_players_on_curses_id"
  add_index "players", ["helmet_id"], name: "index_players_on_helmet_id"
  add_index "players", ["hirelings_id"], name: "index_players_on_hirelings_id"
  add_index "players", ["horse_id"], name: "index_players_on_horse_id"
  add_index "players", ["inventory_id"], name: "index_players_on_inventory_id"
  add_index "players", ["shield_id"], name: "index_players_on_shield_id"
  add_index "players", ["suit_of_armor_id"], name: "index_players_on_suit_of_armor_id"
  add_index "players", ["weapon_id"], name: "index_players_on_weapon_id"

  create_table "players_queues", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "turn_number"
    t.boolean  "complete"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sound_chits", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "tile_id"
    t.boolean  "lost_city"
    t.boolean  "lost_castle"
    t.string   "name"
    t.integer  "tile_clearing_number"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "sound_chits", ["game_id"], name: "index_sound_chits_on_game_id"
  add_index "sound_chits", ["tile_id"], name: "index_sound_chits_on_tile_id"

  create_table "special_chits", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "tile_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "special_chits", ["game_id"], name: "index_special_chits_on_game_id"
  add_index "special_chits", ["tile_id"], name: "index_special_chits_on_tile_id"

  create_table "tiles", force: :cascade do |t|
    t.string "name"
    t.string "tile_type"
  end

  create_table "traversable_clearings", force: :cascade do |t|
    t.integer "clearing_id"
    t.integer "traversable_id"
    t.boolean "hidden"
    t.string  "hidden_type"
  end

  create_table "treasure_locations", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "treasure_id"
    t.integer  "tile_id"
    t.integer  "clearing_id"
    t.boolean  "lost_city"
    t.boolean  "lost_castle"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "treasure_locations", ["clearing_id"], name: "index_treasure_locations_on_clearing_id"
  add_index "treasure_locations", ["game_id"], name: "index_treasure_locations_on_game_id"
  add_index "treasure_locations", ["tile_id"], name: "index_treasure_locations_on_tile_id"
  add_index "treasure_locations", ["treasure_id"], name: "index_treasure_locations_on_treasure_id"

  create_table "treasures", force: :cascade do |t|
    t.boolean  "large"
    t.integer  "spell_type"
    t.integer  "fame_value"
    t.boolean  "great"
    t.integer  "fame_price_number"
    t.integer  "fame_price_natives_id"
    t.string   "enchanted"
    t.integer  "weight"
    t.integer  "notoriety_value"
    t.integer  "price"
    t.boolean  "metatreasure"
    t.boolean  "movable"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "treasures", ["fame_price_natives_id"], name: "index_treasures_on_fame_price_natives_id"

  create_table "weapons", force: :cascade do |t|
    t.string   "weapon_name"
    t.boolean  "ranged"
    t.integer  "length"
    t.integer  "price"
    t.integer  "harm"
    t.integer  "alerted_harm"
    t.integer  "time"
    t.integer  "alerted_time"
    t.integer  "sharp"
    t.integer  "alerted_sharp"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
