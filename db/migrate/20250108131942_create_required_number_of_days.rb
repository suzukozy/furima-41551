class CreateRequiredNumberOfDays < ActiveRecord::Migration[7.0]
  def change
    create_table :required_number_of_days do |t|
      t.string :name

      t.timestamps
    end
  end
end
