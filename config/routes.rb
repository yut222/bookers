Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'homes/top' => 'homes#top'

  resources :books  #rails routes ターミナルでルーティングを確認(ページを表示するため)
  
  root :to => 'homes#top'
end