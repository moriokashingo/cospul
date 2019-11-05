class CreateCospulPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :cospul_pictures do |t|
      t.text        :picture
      t.integer     :user_id
      t.references  :cospul, foreign_key: true
      t.timestamps
    end
  end
end
