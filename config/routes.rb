Rails.application.routes.draw do
  root "pages#home", as: :home

  resource :session, only: [:new, :create, :destroy]
  resource :user, only: [:new, :create]

  namespace :admin do
    root "users#index"

    resources :users, only: [:index, :edit, :create, :update, :destroy]
    resources :assessments, only: [:index]
  end

  get :contact, to: "pages#contact"
  get :preview, to: "pages#preview"
end
