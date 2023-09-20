Rails.application.routes.draw do
  devise_for :users
    root to: 'yoyakus#index'  # ルートパスの設定
    resources :yoyakus do    # RESTfulなリソースとしてのルート
      resources :guests
      #   member do
      #     get 'cancel'
      # end
    end
  end
