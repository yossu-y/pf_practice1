Rails.application.routes.draw do
  
  # 利用者用ルーティング
  scope module: :user do
    root to: "homes#top"
    get "about" => "homes#about", as: "about"
    
  end
  
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
