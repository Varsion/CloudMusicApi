Rails.application.routes.draw do
	
	namespace :v1 do
		get 'monitors/version'
		resources :users
	end
	
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'homes#index'
end
