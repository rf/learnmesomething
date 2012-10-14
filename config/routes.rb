LearnMeSomething::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users

  match "/search/:query" => "home#search"
  match "/search" => "home#search"

  resources :users do
    resources :requests, :controller => 'users/requests', :only => [:index]
    resources :responses, :controller => 'users/responses', :only => [:index]
  end

  resources :requests do
    resources :responses, :controller => 'requests/responses', :only => [:index, :create, :destroy, :edit, :update]
  end
  
  match "/requests/:request_id/responses/:id/upvote" => "requests/responses#upvote", :as => 'upvote_request_response', :via => :post
  match "/requests/:request_id/responses/:id/downvote" => "requests/responses#downvote", :as => 'downvote_request_response', :via => :post
end
