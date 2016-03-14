Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :users do 
    post :favorites, :on => :collection, to: 'users#add_to_favorites'
  end
end
