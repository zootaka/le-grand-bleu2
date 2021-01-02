Rails.application.routes.draw do
  devise_for :users
  root to: "maps#index"

  resources :maps, only: [:index, :create] do
    resources :boards, only: [:index, :create, :destroy]
  end

  resources :users, only: [:index, :edit, :update, :destroy]do
    resources :log_books, only: [:create, :edit, :update, :show, :new, :destroy]
  end
end
