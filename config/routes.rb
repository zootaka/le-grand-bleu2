Rails.application.routes.draw do
  devise_for :users
  root to: "maps#index"
  
  resources :maps, only: [:index, :create] do
    resources :boards, only [:index, :create, :destroy]
  end

  resources :users, only: [:index, :edit, :update, :destroy]
end
