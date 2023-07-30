Rails.application.routes.draw do
  resources :profiles
  devise_for :users

  resources :chatrooms, only: %i[index show create] do
    resources :messages, only: :create
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'profiles#index'
end
