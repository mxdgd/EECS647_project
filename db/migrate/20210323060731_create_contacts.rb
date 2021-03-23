class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.belongs_to :user, null: false
      t.string :email
      t.string :facebook
      t.string :instagram
      t.string :twitter
      t.string :vimeo
      t.string :youtube
      t.timestamps
    end
  end
end