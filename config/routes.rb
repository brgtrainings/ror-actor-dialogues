Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/dialogues', to: 'dialogues#index'
  # get '/dialogues/:id', to: 'dialogues#show'
  resources :dialogues, only: [:index, :show, :new, :create]
end
