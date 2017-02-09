Rails.application.routes.draw do
  get 'stories/search', to: 'stories#search'

  root :to => 'users#index'

  resources :stories do
    resources :sentences
  end

  resources :users do
    resources :sentences, only: [:show]
  end
end
