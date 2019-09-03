# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: :login, sign_out: :logout}
  ActiveAdmin.routes(self)

  root 'links#index'

  resources :links, only: %i[index]
  resources :tracks, only: %i[index destroy show]

  get '/link', to: 'links#show'
end
