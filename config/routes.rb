Rails.application.routes.draw do
  namespace :admin do
    get 'dashboards/index'
  end
  scope "/(:locale)", locale: /fr/ do
    namespace :admin do
      get 'pages/home'
      resources :properties
      resources :users
    end
    root to: "pages#home"
    devise_for :users
    resources :properties do
      get "search", on: :collection
    end
    resources :contact_us, only: [:create]
    get "contactez-nous", to: "contact_us#new"
    get "contact_us", to: redirect("/contactez-nous")
    # get 
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # get '/img/:name.:ext', :to => redirect('/assets/%{name}.%{ext}')
  # match '/404' => 'errors#not_found'
  # match '/422' => 'errors#server_error'
  # match '/500' => 'errors#server_error'
end
