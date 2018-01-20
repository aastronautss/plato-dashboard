class AddConfirmedToExternalServices < ActiveRecord::Migration[5.1]
  def change
    add_column :external_services, :confirmed, :boolean, default: false
  end
end
