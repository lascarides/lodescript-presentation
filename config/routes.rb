LodescriptNdf::Application.routes.draw do

	resources :pieces
	resources :organizations
	resources :equivalents
	resources :schemes
	resources :things

	get '/synthi/search', to: 'synthi#results'
	get '/synthi/:id', to: 'synthi#record'

	root :to => "home#index"
	
end
