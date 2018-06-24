Rails.application.routes.draw do
  root to: 'landing#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root to: 'categories#index' 
  
  scope module: :v1  do
  	resources :categories, only: [:index]
    resources :products
  end

end
