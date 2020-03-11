Rails.application.routes.draw do
  # home route 
  root 'welcome#home'
  # Blog route 
   resources :articles # delete, update, destroy, get, post
end
