class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :score
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
