class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :activity_id

      t.timestamps
    end

    add_index :events, :user_id
    add_index :events, :activity_id

  end
end
