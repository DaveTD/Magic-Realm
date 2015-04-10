Rails.application.routes.draw do

  #Game Routes
  match '/games', :controller => 'game', :action => 'create', via: [:options]
  match '/master_cheat_mode', :controller => 'master_cheat_mode', :action => 'master_cheat_mode', via: [:get]
  match '/inventory/:game_id/:player_id', :controller => 'treasures', :action => 'inventory', via: [:get]

  resources :games do
    member do
      get 'lost_items'
      get 'time_of_day'
      get 'current_player'
      get 'cheat_mode'
      get 'master_cheat_mode'
      get 'show_clearing_treasures'
      get 'winning'
      get 'dead'
    end
    resources :gold_sites
    resources :sound_chits
    resources :treasures
    resources :monsters
    resources :special_chits
    resources :discovered_chits_clearings
    resources :found_hidden_paths
    resources :found_hidden_passages
    resources :players_queues
    resources :players, only: [:index, :edit, :update]
  end

  resources :clearings

  #Player Routes
  match '/players', :controller => 'players', :action => 'create', via: [:options]
  match '/players/:id', :controller => 'players', :action => 'update', via: [:options]
  match '/players/:id/destroy_last_action', :controller => 'players', :action => 'destroy_last_action', via: [:options]

  resources :players, only: [:show, :update, :create] do
    member do
      get 'chose_selection'
      put 'destroy_last_action'
      get 'submit_actions'
      get 'next_action'
      get 'end_turn'
      get 'update_block'
    end
  end

  # Action Queue Routes
  match '/action_queues', :controller => 'action_queues', :action => 'create', via: [:options]
  match '/action_queues/:id', :controller => 'action_queues', :action => 'update', via: [:options]
  # match '/action_queues/actions_this_turn', :controller => 'action_queues', :action => 'actions_this_turn', via: [:options]

  resources :action_queues, only: [:create, :update] do
    collection do
      get 'actions_this_turn'
    end
  end

  resources :fight_queues, only: [] do
    member do
      get 'fight'
      get 'other_fights'
      get 'submit_fight'
      get 'current_state'
      get 'player_choice'
    end
    collection do
      get 'find_fight'
    end
  end

end
