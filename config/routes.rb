Furcons::Application.routes.draw do
	root "furcons#index"
	resources :furcons do
		resources :memberships
	end
end