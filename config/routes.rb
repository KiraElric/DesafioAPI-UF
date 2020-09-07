Rails.application.routes.draw do
  #resources :consults
  post '/uf/:date', to: 'consults#getUF'
  post '/client/:name', to: 'consults#usage' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
