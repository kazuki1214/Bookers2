class RemoveRefileImageFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :refile_image, :string
  end
end
