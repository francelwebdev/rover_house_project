Rails.application.routes.draw do
  scope "/(:locale)", locale: /fr|en/ do
    namespace :admin do
      root to: "users#index"
    end
    root to: "pages#home"
    devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
      resources :properties do
      collection do
        get "search", to: "properties#index"
      end
    end
    resource :profile, only: [:show]
    resources :my_properties, only: [:index]
    resources :contact_us, only: [:create]
    get "nous-contacter", to: "contact_us#new"
    get "contact_us", to: redirect("/nous-contacter")
    get "users", to: redirect("/users/sign_up")
    # match '/404' => 'errors#not_found'
    # match '/422' => 'errors#server_error'
    # match '/500' => 'errors#server_error'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
