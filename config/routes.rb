Rails.application.routes.draw do
  resources :events, only: [:new, :create, :edit, :update]
end
