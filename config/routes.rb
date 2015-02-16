Rails.application.routes.draw do
  resources :games,  only: [:index, :new, :create]

  resources :players, only: [:show, :update] do
    member do
      put 'move_clearing'
    end
  end
end
