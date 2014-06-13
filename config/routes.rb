Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: [:create, :update]
  end
  resources :answers, only: :update

  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout

end
