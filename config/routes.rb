Rails.application.routes.draw do
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")  
  root "home#index"
  post "/generate_cashfree_token" => "cashfree#generate_cashfree_token"
  get  "/cashfree_paid" => "cashfree#cashfree_paid"
  get  "/thank_you" => "home#thank_you"
  get  "/error" => "home#error"
  
end
