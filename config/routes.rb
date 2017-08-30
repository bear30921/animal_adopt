Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats do
    member do
      put :favorite
    end
  end

  get "/lists", to: "cats#favorite_list"


  root "cats#index"

end
