class AddCountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :count, :integer
  end
end
