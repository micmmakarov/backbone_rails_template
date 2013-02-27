Jsonland::Application.routes.draw do

  namespace :api do
    resources :posts
  end


  get "home/index"

  devise_for :users

  match '*path' => "home#index"
  root :to => "home#index"

end
