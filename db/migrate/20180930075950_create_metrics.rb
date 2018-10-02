class CreateMetrics < ActiveRecord::Migration[5.2]
  def change
    create_table :metrics do |t|
      t.integer :glucose_unit
      t.integer :user_id

      t.timestamps
    end
  end
end
