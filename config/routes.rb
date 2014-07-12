Rails.application.routes.draw do
  root "page#index"

  get '/about' => 'page#about', as: 'about'

  resources :admin, :path => "admin", only: [:index, :new, :create]
  	post '/session' => 'admin#auth', as: "session"
  	get '/signout' => 'admin#signout', as: "admin_signout"

	resources :gallery, :path => "gallery"
		get '/admin/add-image' => "gallery#new", as: "add_gallery"
		get '/admin/images' => "gallery#index", as: "index_gallery"
		post '/admin/create-image' => "gallery#create", as: "create_gallery"

end
