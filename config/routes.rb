Rails.application.routes.draw do
  
  resources :cars, only: [:index, :create, :show, :destroy]
  
end
