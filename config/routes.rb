Rails.application.routes.draw do
  devise_for :admins 
    # delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_admin_session
  root to: 'yoyakus#index'  # ルートパスの設定
  resources :yoyakus do    # RESTfulなリソースとしてのルート
    resources :users
    member do
      get 'user_show'
    end
  end
end
