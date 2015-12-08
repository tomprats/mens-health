Rails.application.routes.draw do
  root "pages#home", as: :home

  resource :session, only: [:new, :create, :destroy]
  resource :user, only: [:new, :create]
  resources :assessments, only: [:create, :show, :update], param: :uid
  get "assessments/:uid/results", to: "assessments#results", as: :assessment_results

  namespace :admin do
    root "users#index"

    resources :users, only: [:index, :edit, :create, :update, :destroy]
    resources :assessments, only: [:index]
    resources :analytics, only: [:index]
  end

  get :contact, to: "pages#contact"
  get :preview, to: "pages#preview"
end
