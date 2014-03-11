Furcons::Application.routes.draw do
	resource :session
	get "signin" => "sessions#new"
	resources :users
	get "signup" => "users#new"

	root "furcons#index"
	resources :furcons do
		resources :memberships
	end
end