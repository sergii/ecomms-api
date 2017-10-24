Rails.application.routes.draw do
  resources :products, only: [:index, :show, :create, :update]
  post 'login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
