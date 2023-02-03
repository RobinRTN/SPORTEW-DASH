class CreateClientsSports < ActiveRecord::Migration[7.0]
  def change
    create_table :clients_sports do |t|
      t.references :client, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
