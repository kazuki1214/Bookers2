class AddRefileImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :refile_image, :string
  end
end
