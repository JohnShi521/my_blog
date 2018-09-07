Rails.application.routes.draw do
  namespace :admin_magic do
    get 'categories/index'
  end
  devise_for :users, :controllers => { :sessions => "users/sessions",:passwords => "users/passwords",:registrations => "users/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  resource :home,only: [:index] do
    member do
      get "detail" => "home#detail"
    end
  end

  namespace :admin_magic do
    root "articles#index"
    resources :articles do

    end

    resources :categories do

    end

    resources :tags do

    end
  end
end
