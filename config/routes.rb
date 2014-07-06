Rails.application.routes.draw do

root 'embark#home', as: 'home'
get '/adventures', to: 'embark#adventures', as: 'adventures'
get '/adventures/:adventure_id', to: 'embark#description', as: 'description'


end
