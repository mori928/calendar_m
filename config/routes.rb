Rails.application.routes.draw do
  devise_for :users
    root to: 'yoyakus#index'  # ルートパスの設定
    resources :yoyakus do    # RESTfulなリソースとしてのルート
      resources :guests, only: [:index, :new, :create, :show]
        # member do
        #   get 'guest'
      # end
    end
  end
