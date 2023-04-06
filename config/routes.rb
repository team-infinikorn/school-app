# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'students#index'

  resources :students, only: %i[index new create show]
  resources :invitations, only: %i[new create] do
    collection do
      get :accept
      get :reject
    end
  end
end
