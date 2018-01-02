class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :image
      t.string :caption
      t.integer :user_id

      t.timestamps
    end
    add_reference :pictures, :users, foreign_key: true

  end
end
