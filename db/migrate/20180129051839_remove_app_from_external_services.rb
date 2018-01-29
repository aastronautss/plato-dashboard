class RemoveAppFromExternalServices < ActiveRecord::Migration[5.1]
  def change
    remove_column :external_services, :app, :integer
  end
end
