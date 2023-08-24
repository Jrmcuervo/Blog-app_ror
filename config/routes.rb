Rails.application.routes.draw do
  get '/users/index', to: 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
