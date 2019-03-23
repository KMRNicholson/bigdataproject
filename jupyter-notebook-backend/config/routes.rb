Rails.application.routes.draw do
  resources :snippets
  post 'snippets/search', to: 'snippets#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
