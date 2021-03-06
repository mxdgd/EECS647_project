class CreateAwards < ActiveRecord::Migration[6.1]
  def change
    create_table :awards do |t|
      t.belongs_to :film, null: false
      t.string :festival, null: false
      t.string :place, null: false
      t.timestamps
    end
  end
end
