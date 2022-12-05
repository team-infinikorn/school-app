# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: '/admin/sign_in', sign_out: 'admin/sing_out' }, controllers: {
    sessions: 'users/sessions'
  }

  namespace :admin do
    resources :dashboard, only: %i[index]
  end
end
