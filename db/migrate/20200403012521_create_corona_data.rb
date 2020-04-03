class CreateCoronaData < ActiveRecord::Migration[6.0]
  def change
    create_table :corona_data do |t|
      t.date :reported_at
      t.string :state
      t.integer :city_id
      t.string :city
      t.integer :confirmed
      t.integer :deaths

      t.timestamps
    end
  end
end
