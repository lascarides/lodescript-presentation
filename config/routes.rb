LodescriptNdf::Application.routes.draw do

	resources :pieces
	resources :organizations
	resources :equivalents
	resources :schemes
	resources :things do 
		post :sort_memberships, on: :collection
	end

	get '/synthi/search', to: 'synthi#results'
	get '/synthi/:id', to: 'synthi#record'

	root :to => "home#index"
	
end
