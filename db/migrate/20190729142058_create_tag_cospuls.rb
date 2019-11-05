class CreateTagCospuls < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_cospuls do |t|
      t.references :cospul, foreign_key: true
      t.references :tag   , foreign_key: true

      t.timestamps
    end
  end
end
