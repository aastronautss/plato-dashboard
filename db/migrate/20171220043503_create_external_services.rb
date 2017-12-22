# frozen_string_literal: true

class CreateExternalServices < ActiveRecord::Migration[5.1]
  def change
    create_table :external_services do |t|
      t.string :type, null: false
      t.string :app, null: false
      t.string :label
      t.jsonb :data

      t.timestamps
    end

    add_index :external_services, :app
    add_index :external_services, :type
  end
end
