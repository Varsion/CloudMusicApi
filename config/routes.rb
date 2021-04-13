Rails.application.routes.draw do
	
	namespace :v1 do
		get 'monitors/version'
		resources :users, except:[:index, :destroy]
		
		# login and logout
		resources :sessions, only: [:create, :destroy]
		# Mails
		post 'mails/request_verification', to: 'mails#request_verification'
	end
	
	namespace :v2 do
		get 'monitors/version'
	end
	
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'homes#index'
end
