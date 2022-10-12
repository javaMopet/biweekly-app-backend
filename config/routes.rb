Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  
  get '/member-data', to: 'members#show'

  if Rails.env.development?
  	mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
 	end
  
  post "/graphql", to: "graphql#execute"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
