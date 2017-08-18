class AddImageToCats < ActiveRecord::Migration[5.1]
  def change
    add_column :cats, :image, :string
  end
end
