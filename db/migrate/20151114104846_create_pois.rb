class CreatePois < ActiveRecord::Migration
  def change
    create_table :pois do |t|
      t.string :name, null: false
      t.text :description, default: ''
      t.st_point :lonlat, geographic: true, srid: 4326, null: false
      t.timestamps null: false
    end
  end
end
