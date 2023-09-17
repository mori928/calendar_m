Rails.application.routes.draw do
  root to: 'yoyakus#index'  # ルートパスの設定
  resources :yoyakus do    # RESTfulなリソースとしてのルート
    resources :users
  end
end
