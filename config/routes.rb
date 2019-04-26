Rails.application.routes.draw do
  scope "/(:locale)", locale: /fr/ do
    root to: "pages#home"
    devise_for :users, controllers: {registrations: "registrations"}
    resources :properties do
      collection do
        get "search"
      end
    end
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
