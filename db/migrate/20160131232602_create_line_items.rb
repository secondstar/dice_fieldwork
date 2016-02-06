class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :service, index: true
      t.belongs_to :cart, index: true

      t.timestamps null: false
    end
  end
end
