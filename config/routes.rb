Rails.application.routes.draw do
  scope "/(:locale)", locale: /fr/ do
    # namespace :admin do
      # get 'pages/home'
      # resources :properties
      # resources :users
      # get 'dashboards/index'
    # end
    root to: "pages#home"
    devise_for :users
    resources :properties do
      collection do
        get 'search', to: "properties#index"
      end
    end
    get "search", to: "searches#index"
    resources :contact_us, only: [:create]
    get "contactez-nous", to: "contact_us#new"
    get "contact_us", to: redirect("/contactez-nous")

    resources :ad_types, only: [:index, :show] do
      resources :properties, only: :new
    end

    # get '/img/:name.:ext', :to => redirect('/assets/%{name}.%{ext}')
  # match '/404' => 'errors#not_found'
  # match '/422' => 'errors#server_error'
  # match '/500' => 'errors#server_error'

  # get "/login", to: "devise/sessions#new"
  # get "/registrer", to: "devise/registrations#new"
  # get "/logout", to: "devise/sessions#destroy"

end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
