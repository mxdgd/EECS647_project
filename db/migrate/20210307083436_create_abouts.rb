class CreateAbouts < ActiveRecord::Migration[6.1]
  def change
    create_table :abouts do |t|
      t.belongs_to :user
      t.text :bio, default: ""
      t.timestamps
    end
  end
end
