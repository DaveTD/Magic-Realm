Rails.application.routes.draw do
  match '/players/:id/move_clearing', :controller => 'players', :action => 'move_clearing', via: [:options]

  resources :games,  only: [:index, :new, :create]

  resources :players, only: [:show, :update] do
    member do
      put 'move_clearing'
    end
  end
end
