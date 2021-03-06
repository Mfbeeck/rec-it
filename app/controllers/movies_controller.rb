class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @movies = Movie.where(user_id: params[:user_id])
    @movie_ratings = MovRating.where(user_id: params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
  end

  def new
    @movie = Movie.new
    @mov_rating = MovRating.new
    @user = current_user
  end

  def edit
    @movie = Movie.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    respond_to do |format|
      if @movie.save 
        @mov_rating = MovRating.create(rating: params[:rating], movie_id: @movie.id, user_id: current_user.id) if params[:rating].present?
        format.html { redirect_to user_movies_path(current_user), notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to user_movies_path(current_user), notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to user_movies_path(current_user), notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end
    
    def movie_params
      params.require(:movie).permit(:id, :name, :rating, :description, :user_id)
    end
end
