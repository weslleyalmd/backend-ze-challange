Rails.application.routes.draw do
  resources :suppliers 

  get 'closest_supplier', to: 'suppliers#closest'
end
