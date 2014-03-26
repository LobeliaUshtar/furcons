Furcons::Application.routes.draw do
	resource :session
	get "signin" => "sessions#new"
	resources :users
	get "signup" => "users#new"

	get 'furcons/:scope' => "furcons#index", constraints: { scope: /everything|upcoming_prereg|upcoming|past|recent/ }, as: :filtered_furcons
	
	root "furcons#index"
	resources :furcons do
		resources :memberships
	end
end