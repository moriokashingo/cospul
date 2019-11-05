class CreateCospuls < ActiveRecord::Migration[5.2]
  def change
    create_table :cospuls do |t|
      t.string      :title
      t.text        :content
      t.references  :user                   , null: false, foreign_key: true
      t.integer     :likes_count
      t.timestamps
    end
  end
end
