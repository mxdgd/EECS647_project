class IndexesController < ApplicationController
  def index
    @about = About.first()
    @films = Film.all().order(release_date: :desc)
    @contact = Contact.first()
  end
end