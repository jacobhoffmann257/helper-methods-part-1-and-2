class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def index
    @movies = Movie.order({ :created_at => :desc })

    respond_to do |format|
      format.json do
        render json: @movies
      end

      format.html do
      end
    end
  end

  def show
#@the_movie = Movie.find_by({ :id => params.fetch(:id) })# finds first matching record and returns it to you
@movie = Movie.find(params.fetch(:id))# does same thing as above but returns a record not found message
  end

  def create
    movie_attr = params.require(:movie).permit(:title, :description)
    @movie = Movie.new(movie_attr)

    if @movie.valid?
      @movie.save
      redirect_to(movies_url, { :notice => "Movie created successfully." })
    else
      render template: "movies/new" 
    end
  end

  def edit
    @movie = Movie.find(params.fetch(:id))

    render({ :template => "movies/edit" })
  end

  def update
    movie_attr = params.require(:movie).permit(:title, :description)
    movie = Movie.new(movie_attr)

    if movie.valid?
      movie.save
      redirect_to(movie_url(movie), { :notice => "Movie updated successfully."} )
    else
      redirect_to(movie_url(movie), { :alert => "Movie failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch(:id)
    movie = Movie.where({ :id => the_id }).first

    movie.destroy

    redirect_to(movies_url, { :notice => "Movie deleted successfully."} )
  end
end
