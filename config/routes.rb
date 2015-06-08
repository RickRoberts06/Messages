Rails.application.routes.draw do

  root "messages#index"

   get "/messages" => "messages#new"
   post "/messages" => "messages#create"

   get "/messages/:id" => "messages#edit", as: :message


   patch '/messages/:id' => 'messages#update'

   delete "/messages/:id"   => "messages#destroy"


end
