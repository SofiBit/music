# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: :login, sign_out: :logout},
                    controllers: { omniauth_callbacks: "callbacks" }
  ActiveAdmin.routes(self)

  root 'links#index'

  resources :search, only: %i[index]
  resources :links, only: %i[index]
  resources :tracks, only: %i[index show update]
  resources :users, only: :show do
    resources :playlists, only: %i[index show]
  end
  resources :playlists, only: %i[new create destroy edit update]
  resources :playlist_subscriptions, only: %i[create destroy]
  resources :notifications, only: :index
  resources :adding_tracks, only: %i[new create destroy update]
  resources :adding_track_to_users, only: %i[new create destroy]
  resources :assessments, only: %i[index create destroy]
  resources :comments
  resources :tags, only: %i[index create destroy]
  resources :rooms
  resources :room_messages
  resources :user_subscriptions, only: %i[create destroy]
  resources :tags

  get '/assessment', to: 'assessments#show'
  get '/link', to: 'links#show'
  mount ActionCable.server => '/cable'
end
