Rails.application.routes.draw do

  #Game Routes
  resources :games, only: [:index, :create, :show]
  match '/games/:id/lost_items', :controller => 'games', :action => 'lost_items', via: [:get]

  #Player Routes
  match '/players', :controller => 'players', :action => 'create', via: [:options]
  match '/players/:id/chose_selection', :controller => 'players', :action => 'chose_selection', via: [:options]
  match '/players/:id/destroy_last_action', :controller => 'players', :action => 'destroy_last_action', via: [:options]
  match '/players/:id/submit_actions', :controller => 'players', :action => 'submit_actions', via: [:options]
  match '/players/:id/next_action', :controller => 'players', :action => 'next_action', via: [:options]

  resources :players, only: [:show, :create] do
    member do
      put 'chose_selection'
      put 'destroy_last_action'
      put 'submit_actions'
      put 'next_action'
    end
  end

  # Action Queue Routes
  match '/action_queues', :controller => 'action_queues', :action => 'create', via: [:options]
  match '/action_queues/:id', :controller => 'action_queues', :action => 'update', via: [:options]

  resources :action_queues, only: [:create, :update]
end
