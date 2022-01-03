class RemoveRefileImageIdFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :refile_image_id, :string
  end
end
