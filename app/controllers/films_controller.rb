class FilmsController < ApplicationController
  def index
    @page = params.fetch(:page, 0).to_i
    @pages_count = (Film.all.count / 5.to_f).ceil
    @films = Film.offset(@page*5).limit(5).order(release_date: :desc)
  end
  
  def show
    @film = Film.find(params[:id])
  end
end