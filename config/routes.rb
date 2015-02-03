Rails.application.routes.draw do
  resources :game,  only: [:index, :new, :create]
end
