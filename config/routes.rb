Rails.application.routes.draw do

	post 'user/login'

	post 'user/signup'

	get 'user/logout'

	root 'embark#home'

	get '/adventures', to: 'embark#adventures', as: 'adventures'
	
	get '/adventures/:adventure_id', to: 'embark#description', as: 'description'

	get '/adventures/map', to: 'embark#map', as: 'map'
	
	resources :admin, only: [:show,:index]
	
end
