Rails.application.routes.draw do
  devise_for :admins 
    root to: 'yoyakus#index'  # ルートパスの設定
    resources :yoyakus do    # RESTfulなリソースとしてのルート
      resources :users, only: [:index, :new, :create]
        # member do
        #   get 'user'
      # end
    end
  end
