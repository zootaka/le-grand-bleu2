Rails.application.routes.draw do
  devise_for :users
  root to: "maps#index"
  get  '/explanation',    to: 'static_pages#explanation'

  resources :maps, only: [:index, :create] do
    resources :boards, only: [:index, :create, :destroy]
  end

  resources :users, only: [:index, :edit, :update, :destroy]do
    resources :log_books, only: [:index,:create, :edit, :update, :show, :new, :destroy]
  end
end
