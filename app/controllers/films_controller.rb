class FilmsController < ApplicationController
  def index
    @films = Film.all().order(release_date: :desc)
  end
  
  def show
    @film = Film.find(params[:id])
  end
end