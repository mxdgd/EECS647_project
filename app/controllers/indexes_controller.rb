class IndexesController < ApplicationController
  def index
    @about = About.first()
    @films = Film.all()
    @contact = Contact.first()
  end
end