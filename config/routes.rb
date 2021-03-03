Rails.application.routes.draw do
  resources :books, only: [:index]

  resources :publishers, only: %i[create index show]
  resources :authors, only: %i[create index show] do
    resources :books
  end
end
