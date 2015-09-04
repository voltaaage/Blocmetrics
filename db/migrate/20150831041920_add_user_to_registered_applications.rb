class AddUserToRegisteredApplications < ActiveRecord::Migration
  def change
    add_column :registered_applications, :user_id, :string
    add_index :registered_applications, :user_id
  end
end
