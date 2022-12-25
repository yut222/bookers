Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'homes/top' => 'homes#top'

  get 'books/new'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  # resources :homes
end
