Rails.application.routes.draw do
  #get("/", { :controller => "movies", :action => "index" })
  root "movies#index"
  # Routes for the Movie resource:

  # CREATE
  post"/movies"=>  "movies#create", as: :movies
  get"/movies/new" => "movies#new", as: :new_movie
          
  # READ
  get"/movies"=> "movies#index"
  get"/movies/:id"=> "movies#show", as: :movie
  #how to name a route, use details_path(id) to call details_url(id) gives the entire url
  
  # UPDATE
  patch"/movies/:id"=> "movies#update"
  get"/movies/:id/edit" => "movies#edit", as: :edit_movie
  
  # DELETE
  delete "/movies/:id"=> "movies#destroy"

  #------------------------------
end
