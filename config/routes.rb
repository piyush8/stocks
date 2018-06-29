Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/stock' => 'order#method_name'
  get '/stock/index' => 'order#index'
  put '/stock' => 'order#update'
  delete '/stock' => 'order#delete'
end
