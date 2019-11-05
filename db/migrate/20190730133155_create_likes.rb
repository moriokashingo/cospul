class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :cospul_id
      t.index   :user_id
      t.index   :cospul_id
      t.index   [:user_id, :cospul_id]  , unique: true
      t.timestamps
    end
  end
end
