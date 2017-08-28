class ChangeTypeToCats < ActiveRecord::Migration[5.1]
  def change
    change_column :cats, :type, :integer
  end
end
