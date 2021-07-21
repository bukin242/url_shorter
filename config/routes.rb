Rails.application.routes.draw do
  root to: 'root#index'
  resources :urls, only: %i[index new create show] do
    member do
      get 'stats'
    end
  end
end
