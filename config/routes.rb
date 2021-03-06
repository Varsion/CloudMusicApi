Rails.application.routes.draw do
	
	namespace :v1 do
		get 'monitors/version'
		
		# 重置密码
		post 'users/reset_password', to: 'users#reset_password'
		
		resources :users, except:[:index, :destroy]

		# login and logout
		resources :sessions, only: [:create, :destroy]
		
		# 绑定第三方账号
		post 'users/bind', to: 'users#bind'
		
		# 解绑第三方账号
		delete 'users/:id/unbind', to: 'users#unbind'
		# Mails
		post 'mails/request_verification', to: 'mails#request_verification'
		get 'mails/:id/confirm_verification/' , to: 'mails#confirm_verification'
		# 验证码
		post 'codes/request_email_code', to: 'codes#request_email_code'
		post 'code/request_sms_code', to: 'codes#request_sms_code'
		# 广告
		resources :ads,except: [:show]
		# 歌单
		resources :sheets do
			resources :relations, only: [:create, :destroy]
		end
		# 歌曲
		resources :songs
		resources :collections, only: [:create, :destroy]
		resources :tags, only: [:index, :create, :update, :destroy]
		# 视频
		resources :videos
		# 评论
		resources :comments, except: :update
	end
	
	namespace :v2 do
		get 'monitors/version'
	end
	
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'homes#index'
end
