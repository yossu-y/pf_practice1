Rails.application.routes.draw do
  
  # 利用者用ルーティング
  scope module: :user do
    root to: "homes#top"
    get "about" => "homes#about", as: "about"
    
    get "users/unsubscribe" => "users#unsubscribe"
    patch "users/withdraw"  => "users#withdraw"
    get "users/my_page"     => "users#show"
    resource :users, only: [:edit, :update]
    
  end
  
  devise_for :users,skip: [:passwords], controllers: {
      registrations: "user/registrations",
      sessions: "user/sessions"
    }
  
  
  # 管理者用ルーティング
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
