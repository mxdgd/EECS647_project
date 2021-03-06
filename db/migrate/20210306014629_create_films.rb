class CreateFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :films do |t|
      t.belongs_to :user, null: false
      t.string :title, null: false
      t.string :vimeo_link, null: false
      t.text :description, null: false
      t.date :release_date, null: false
      t.timestamps
    end
  end
end
