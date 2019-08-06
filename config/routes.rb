# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: :login, sign_out: :logout}

  root 'links#index'

  resources :links, only: %i[index]
  resources :source_links, only: %i[index destroy]

  get '/link', to: 'links#show'
end
