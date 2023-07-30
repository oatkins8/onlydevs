Rails.application.routes.draw do
  devise_for :users

  root 'profiles#index'
  resources :profiles do
    resources :questions, only: [:new, :create, :destroy] do
      resources :answers, only: [:new, :create, :destroy]
    end
  end
end
