Rails.application.routes.draw do
  
  # 利用者用ルーティング
  scope module: :user do
    root to: "homes#top"
    get "about" => "homes#about", as: "about"
    
    get "users/unsubscribe" => "users#unsubscribe"
    get "users/my_page"     => "users#show"
    patch "users/withdraw"  => "users#withdraw"
    # resourcesにする必要あり？
    resource :users, only: [:edit, :update]
    
    resources :articles, only: [:index, :new, :show, :edit, :create, :destroy, :update]
    
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
