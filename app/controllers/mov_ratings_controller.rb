class MovRatingsController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @mov_ratings = MovRating.where(user_id: params[:user_id])

  end

  def show
    @user = User.find(params[:user_id])
  end

  def new
    @mov_rating = MovRating.new
    @user = current_user
  end

  def edit
    @mov_rating = MovRating.find(params[:id])
    @user = User.find(params[:user_id])
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
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:id, :name, :rating, :description, :user_id)
    end
end