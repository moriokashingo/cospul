class CreateCospulDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cospul_details do |t|
      t.text        :head
      t.text        :top
      t.text        :inner
      t.text        :bottom
      t.text        :shoe
      t.references  :cospul, foreign_key: true
      t.timestamps
    end
  end
end
