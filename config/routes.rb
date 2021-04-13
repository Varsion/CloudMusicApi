Rails.application.routes.draw do
	
	namespace :v1 do
		get 'monitors/version'
		resources :users, except:[:index, :destroy]
		
		# login and logout
		resources :sessions, only: [:create, :destroy]
		# Mails
		post 'mails/request_verification', to: 'mails#request_verification'
		get 'mails/:id/confirm_verification/' , to: 'mails#confirm_verification'
		# 验证码
		post 'codes/request_email_code', to: 'codes#request_email_code'
	end
	
	namespace :v2 do
		get 'monitors/version'
	end
	
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'homes#index'
end
