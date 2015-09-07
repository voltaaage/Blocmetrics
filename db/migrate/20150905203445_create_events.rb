class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.references :registered_application, index: true

      t.timestamps null: false
    end
  end
end
