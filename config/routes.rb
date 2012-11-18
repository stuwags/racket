SinglyRailsSkeleton::Application.routes.draw do
  match "auth/:service"          => "auth#service"
  match "auth/:service/callback" => "auth#callback"
  match "logout"                 => "auth#logout"
  root :to                       => "default#home"
  match "dashboard"                 => "default#dashboard"
  match "show"          => "auth#show"
  match "serves/save_users/:user_id/:list"          => "serves#save_users"
  
  resources :serves
end
