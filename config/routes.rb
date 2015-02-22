Rails.application.routes.draw do

  #Game Routes
  resources :games, only: [:index, :new, :create]

  #Player Routes
  match '/players/:id/move_clearing', :controller => 'players', :action => 'move_clearing', via: [:options]
  match '/players', :controller => 'players', :action => 'create', via: [:options]
  match '/players/:id/destroy_last_action', :controller => 'players', :action => 'destroy_last_action', via: [:options]
  match '/players/:id/perform_search', :controller => 'players', :action => 'perform_search', via: [:options]

  resources :players, only: [:show, :update, :create] do
    member do
      put 'move_clearing'
      put 'destroy_last_action'
      put 'perform_search'
    end
  end

  # Action Queue Routes
  match '/action_queues', :controller => 'action_queues', :action => 'create', via: [:options]
  match '/action_queues/:id', :controller => 'action_queues', :action => 'update', via: [:options]

  resources :action_queues, only: [:create, :update]
end
