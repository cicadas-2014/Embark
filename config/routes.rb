Rails.application.routes.draw do
  
get '/', to: 'embark#home', as: 'home'
get '/adventures', to: 'embark#adventures', as: 'adventures'
get '/adventures/:adventure_id', to: 'embark#description', as: 'description'


end
