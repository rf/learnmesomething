LearnMeSomething::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users

  match "/search/:query" => "home#search"

  resources :users do
    resources :requests, :controller => 'users/requests', :only => [:index]
    resources :responses, :controller => 'users/responses', :only => [:index]
  end

  resources :requests do
    resources :responses, :controller => 'requests/responses', :only => [:index, :create, :delete]
  end
end
