Rails.application.routes.draw do

  resources :stories do
    resources :sentences
  end

  resources :users do
    resources :sentences, only: [:show]
  end
end
