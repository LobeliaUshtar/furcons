Furcons::Application.routes.draw do
  resources :users

	root "furcons#index"
	resources :furcons do
		resources :memberships
	end
end