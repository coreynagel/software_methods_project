class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :hometown
      t.string :education
      t.string :work
      t.text :interests
      t.string :quote
      t.integer :birth_day
      t.integer :birth_month
      t.integer :birth_year


      t.timestamps
    end
    add_index :profiles, :user_id, unique: true
  end
end
