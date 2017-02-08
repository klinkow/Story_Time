Rails.application.routes.draw do
  root :to => 'users#index'

  resources :stories do
    resources :sentences
  end

  resources :users do
    resources :sentences, only: [:show]
  end
end
