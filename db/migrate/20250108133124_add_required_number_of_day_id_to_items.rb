class AddRequiredNumberOfDayIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :required_number_of_day_id, :integer
  end
end
