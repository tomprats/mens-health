Rails.application.routes.draw do
  root "pages#home", as: :home

  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    root "users#index"

    resources :users, only: [:index, :edit, :create, :update, :destroy]
    resources :assessments, only: [:index]
  end

  get :contact, to: "pages#contact"
end
