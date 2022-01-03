class AddRefileImageIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :refile_image_id, :string
  end
end
