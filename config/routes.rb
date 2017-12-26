# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :employees, skip: [:registration], path: 'employees', controllers: {
    confirmations: 'employees/confirmations',
    passwords: 'employees/passwords',
    sessions: 'employees/sessions',
    unlocks: 'employees/unlocks'
  }

  devise_for :taskmasters, skip: [:registration], path: 'taskmasters', controllers: {
    confirmations: 'taskmasters/confirmations',
    passwords: 'taskmasters/passwords',
    sessions: 'taskmasters/sessions',
    unlocks: 'taskmasters/unlocks'
  }

  devise_for :managers, skip: [:registration], path: 'managers', controllers: {
    confirmations: 'managers/confirmations',
    passwords: 'managers/passwords',
    sessions: 'managers/sessions',
    unlocks: 'managers/unlocks'
  }

  devise_for :principals, skip: [:registration], path: 'principals', controllers: {
    confirmations: 'principals/confirmations',
    passwords: 'principals/passwords',
    sessions: 'principals/sessions',
    unlocks: 'principals/unlocks'
  }

  resources :corporations, only: %i[index show], shallow: true do
    resources :items, only: [:index]
    resources :factories, only: %i[index show] do
      resources :principals, only: %i[show edit update]
      resources :details, only: [:index]
      resources :workshops, only: %i[index show] do
        resources :managers, except: [:index]
        resources :taskmasters do
          resources :employees
        end
      end
    end
  end

  root 'corporations#index'
end
