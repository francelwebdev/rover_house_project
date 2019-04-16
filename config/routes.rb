Rails.application.routes.draw do
  scope "/(:locale)", locale: /fr/ do
    root to: "pages#home"
    devise_for :users
    resources :properties
    resources :contact_us, only: [:create]
    get "contactez-nous", to: "contact_us#new"
    get "contact_us", to: redirect("/contactez-nous")
    # get 
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

      # resources :csdashboard
# resources :dashboard_users
# resources :sessions
# get '/log_out' => 'sessions#destroy', :as => 'log_out'
# get '/log_in' => 'sessions#new', :as => 'log_in'
# post '/sign_up' => 'dashboard_users#new', :as => 'sign_up'
# post '/dashboard_users_index' => 'dashboard_users#new'
# root :to => 'dashboard_users#new'
# get 'csdashboard' => 'csdashboard#index'
# get '/img/:name.:ext', :to => redirect('/assets/%{name}.%{ext}')
# match '/404' => 'errors#not_found'
# match '/422' => 'errors#server_error'
# match '/500' => 'errors#server_error'
end
