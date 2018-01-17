# frozen_string_literal: true

class CreateScrobbles < ActiveRecord::Migration[5.1]
  def change
    create_table :scrobbles do |t|
      t.string :type, null: false
      t.integer :app
      t.jsonb :data

      t.datetime :scrobbled_at
      t.timestamps
    end

    add_index :scrobbles, :type
    add_index :scrobbles, :scrobbled_at
  end
end
