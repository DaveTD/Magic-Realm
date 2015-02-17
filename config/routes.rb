Rails.application.routes.draw do
  match '/players/:id/move_clearing', :controller => 'players', :action => 'move_clearing', via: [:options]
  match '/players', :controller => 'players', :action => 'create', via: [:options]

  resources :games,  only: [:index, :new, :create]

  resources :players, only: [:show, :update, :create] do
    member do
      put 'move_clearing'
    end
  end
end
