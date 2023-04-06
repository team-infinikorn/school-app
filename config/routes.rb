# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'dashboard#index'

  devise_for :users, path: '', path_names: { sign_in: '/admin/sign_in', sign_out: 'admin/sign_out' }, controllers: {
    sessions: 'users/sessions'
  }

  resources :students, only: %i[new create]
  resources :invitations, only: [] do
    collection do
      get :accept
      get :reject
    end
  end

  namespace :admin do
    root to: 'students#index'

    resources :students, only: %i[index show]
    resources :invitations, only: %i[new create]
  end
end
