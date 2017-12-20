# frozen_string_literal: true

class CreateExternalServices < ActiveRecord::Migration[5.1]
  def change
    create_table :external_services do |t|
      t.string :type, null: false
      t.string :name, null: false
      t.jsonb :data

      t.timestamps
    end

    add_index :external_services, :name
    add_index :external_services, :type
  end
end
