class CreateWorkspaces < ActiveRecord::Migration[8.0]
  def change
    create_table :workspaces do |t|
      t.string :title
      t.decimal :latitude
      t.decimal :longitude
      t.string :contact
      t.decimal :price_per_day
      t.time :check_in_time
      t.date :check_in_date
      t.time :check_out_time
      t.date :check_out_date
      t.text :description
      t.integer :max_guests
      t.integer :bedrooms
      t.integer :office
      t.integer :bath
      t.boolean :pet_allowed
      t.integer :wifi_speed
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
