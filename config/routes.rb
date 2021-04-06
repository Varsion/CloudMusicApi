Rails.application.routes.draw do
	# 获取当前项目版本
    get 'monitors/version'
    resources :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'homes#index'
end
