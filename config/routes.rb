Rails.application.routes.draw do
  devise_for :users

  unauthenticated do
    root to: 'items#index', as: :unauthenticated_root
  end

  resources :items
end