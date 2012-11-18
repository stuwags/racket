SinglyRailsSkeleton::Application.routes.draw do
  match "auth/:service"          => "auth#service"
  match "auth/:service/callback" => "auth#callback"
  match "logout"                 => "auth#logout"
  root :to                       => "default#home"
  match "dashboard"                 => "default#dashboard"
  match "show"          => "auth#show"
  
  match '/serves/new', :to => 'serve#new'
  match '/serves/',     :to => 'serves#index'
  match '/serves/:id', :to => 'serves#show'
end
