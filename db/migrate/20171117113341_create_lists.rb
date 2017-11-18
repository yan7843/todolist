class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.date :date
      t.text :note
      t.boolean :is_public
      t.timestamps
    end
  end
end
