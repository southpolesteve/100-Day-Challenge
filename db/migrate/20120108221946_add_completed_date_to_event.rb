class AddCompletedDateToEvent < ActiveRecord::Migration
  def change
    add_column :events, :completed_date, :date
  end
end
