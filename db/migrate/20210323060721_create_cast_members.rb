class CreateCastMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :cast_members do |t|
      t.belongs_to :film, null: false
      t.string :role, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end