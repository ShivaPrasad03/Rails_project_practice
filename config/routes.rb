Rails.application.routes.draw do
  resources :products
  resources :stocks do 
    resources :products, only: [:index, :create]
    #get 'member_route', on: :collection
  end

  # get 'stocks/home' =>'stocks#home' 
  #or get 'stocks/home', to:'stocks#home'
  
  
end
