Rails.application.routes.draw do

  get 'user/login'

  get 'user/signup'

	root 'embark#home', as: 'home'
	get '/adventures', to: 'embark#adventures', as: 'adventures'
	get '/adventures/:adventure_id', to: 'embark#description', as: 'description'

	get '/adventures/map', to: 'embark#map', as: 'map'
	
	resources :admin, only: [:show,:index]


end
