# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: :login, sign_out: :logout}
  ActiveAdmin.routes(self)

  root 'links#index'

  resources :search, only: %i[index]
  resources :links, only: %i[index]
  resources :tracks, only: %i[index destroy show]
  resources :users, only: :show
  resources :friendships, only: %i[create destroy]
  resources :events, only: :index

  get '/link', to: 'links#show'
  mount ActionCable.server => '/cable'
end
