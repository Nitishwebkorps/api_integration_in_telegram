Rails.application.routes.draw do
  resources :posts
  root 'home#index'
  post "home/group_message", to: "home#group_message"
  post "home/send_mesg", to: "home#send_mesg", as: "send_mesg"
  post "home/private_msg", to: "home#private_msg"
  post "home/send_private_message", to: "home#send_private_message", as: "send_private_message"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
