Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: %i[index show new create destroy] do
    resources :doses, only: %i[new create]
  end
  resources :doses, only: [:destroy] # outside of the nesting because we don't need a cocktail id to destroy the dose (same goes for edit update show)
end
