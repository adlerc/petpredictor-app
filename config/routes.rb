Rails.application.routes.draw do
  resources :petpredictor, only: [:index, :show, :create]

  get 'confirm', to: 'petpredictor#confirm', as: :confirm_petpredictor
end
