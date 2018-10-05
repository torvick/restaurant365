Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'invoices/create'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :authentications
    end
  end

end
