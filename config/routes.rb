Rails.application.routes.draw do
  
  namespace :user do
    get 'homes/top'
    get 'homes/about'
  end
  # 利用者用ルーティング
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  
  # 管理者用ルーティング
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
