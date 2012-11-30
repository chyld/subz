class AddSubwaysTable < ActiveRecord::Migration
  def change
    create_table :subways do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :line
      t.timestamps
    end
  end
end
