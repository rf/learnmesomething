LearnMeSomething::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users do
    resources :requests
    resources :responses
  end

  resources :requests do
    resources :responses
  end
end
