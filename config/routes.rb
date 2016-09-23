Rails.application.routes.draw do


  resources :pins do
    #resources :comments
    member do
      post '/repost' => 'pins#repost'
    end
  end

  devise_for :users
  root 'home#index'
  get ':username' => 'users#show', as: 'user'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
