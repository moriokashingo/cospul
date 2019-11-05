class CreateAccessories < ActiveRecord::Migration[5.2]
  def change
    create_table :accessories do |t|
      t.text        :name
      t.references  :cospul_detail, foreign_key: true
      t.timestamps
    end
  end
end
