# frozen_string_literal: true

class CreateScrobbles < ActiveRecord::Migration[5.1]
  def change
    create_table :scrobbles do |t|
      t.string :type, null: false
      t.integer :external_service_id
      t.jsonb :data

      t.datetime :scrobbled_at
      t.timestamps
    end

    add_index :scrobbles, :type
    add_index :scrobbles, :external_service_id
    add_index :scrobbles, :scrobbled_at
    add_index :scrobbles, [:external_service_id, :scrobbled_at], unique: true

    execute <<~SQL
      ALTER TABLE scrobbles
        ADD CONSTRAINT for_upsert UNIQUE (external_service_id, scrobbled_at);
    SQL
  end
end
