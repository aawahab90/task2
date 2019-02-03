Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/customer/:customer_id/sizes', to: 'sizes#show'
  put '/customer/:customer_id/sizes', to: 'sizes#update'
end
