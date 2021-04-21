class Admin::FilmsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :load_film, only: [:show, :edit, :update, :destroy] 

  def index 
    @page = params.fetch(:page, 0).to_i
    @pages_count = (Film.all.count / 5.to_f).ceil
    @films = Film.offset(@page*5).limit(5).order(release_date: :desc)
  end

  def new
    @film = Film.new
    @film.cast_members.build
    @film.awards.build
  end

  def create
    @film = @current_user.films.build(films_params)

    if @film.save
      redirect_to admin_films_path
    else
      @film.cast_members.build    
      @film.awards.build
      render :new
    end
  end

  def edit

  end

  def update
    if @film.update(films_params)
      redirect_to admin_films_path
    else
      render :edit
    end
  end

  def destroy
    @film.destroy
    redirect_to admin_films_path
  end

  private

  def load_film
    @film = @current_user.films.find(params[:id])
  end

  def films_params
    params
      .require(:film)
      .permit(
        :title,
        :vimeo_link,
        :description,
        :release_date,
        cast_members_attributes:[:id, :name, :role, :_destroy],
        awards_attributes:[:id, :place, :festival, :_destroy]
      )
  end
end