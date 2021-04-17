class IndexesController < ApplicationController
  def index
    @about = About.first()
    @films = Film.all().order(release_date: :desc)
    @contact = Contact.first()
    @films_with_awards = Film.joins(:awards).distinct
    @small_team_films = Film.joins("INNER JOIN cast_members ON films.id = cast_members.film_id GROUP BY films.id HAVING COUNT(*) < 6")
  end
end