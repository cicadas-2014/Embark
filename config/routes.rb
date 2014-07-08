Rails.application.routes.draw do

	post 'user/login'

	post 'user/signup'

	get 'user/logout'

	post 'users/addAdventure', to: 'users#addAdventure', as: 'addAdventure'
	
	root 'embark#home', as: 'home'

	get '/adventures', to: 'embark#adventures', as: 'adventures'
	
	get '/adventures/:adventure_id', to: 'embark#description', as: 'description'

	get '/adventures/map', to: 'embark#map', as: 'map'
	
	resources :admin, only: [:show,:index]

	resources :users, only: [:index,:create]

	get '/users/login', to: "users#login"

end
