Rails.application.routes.draw do
  devise_for :admins
  namespace :admin do
    resources :blogs
  end

  resources :blogs, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"

  get "results" => "home#results"
  get "promise" => "home#promise"
  get "treatments" => "home#treatments"

  get "/treatments/:slug", to: "home#treatment", as: :treatment

  get "/types-of-braces", to: "home#types_of_braces", as: :types_of_braces

  get "/types-of-braces/:slug", to: "home#braces", as: :braces

  get "/faq", to: "home#faq", as: :faq

  get "data-security-policy", to: "home#data_security_policy"

  get "practice-policies", to: "home#practice_policies"

  get "cookie-policies", to: "home#cookie_policies"



  resources :appointments, only: [:new, :create]


  get  "/quiz", to: "quiz#start"
  post "/quiz", to: "quiz#save_details"

  get  "/quiz/1", to: "quiz#question1"
  post "/quiz/1", to: "quiz#save_question1"

  get  "/quiz/2", to: "quiz#question2"
  post "/quiz/2", to: "quiz#save_question2"

  get  "/quiz/3", to: "quiz#question3"
  post "/quiz/3", to: "quiz#save_question3"

  get  "/quiz/4", to: "quiz#question4"
  post "/quiz/4", to: "quiz#save_question4"

  get  "/quiz/5", to: "quiz#question5"
  post "/quiz/5", to: "quiz#save_question5"

  get  "/quiz/6", to: "quiz#question6"
  post "/quiz/6", to: "quiz#save_question6"

  get  "/quiz/complete", to: "quiz#complete"
  post "/quiz/results", to: "quiz#results"

  get "/quiz/result/:id", to: "quiz#result"
end
