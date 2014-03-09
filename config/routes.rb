Furcons::Application.routes.draw do
	get "signup" => "users#new"
  resources :users

	root "furcons#index"
	resources :furcons do
		resources :memberships
	end
end