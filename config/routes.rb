# frozen_string_literal: true

Rails.application.routes.draw do
  root 'links#index'

  resources :links, only: %i[index show]
end
