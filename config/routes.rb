Rails.application.routes.draw do
  devise_for :users
  # トップページをitems#indexに設定
  root to: 'items#index'
end
