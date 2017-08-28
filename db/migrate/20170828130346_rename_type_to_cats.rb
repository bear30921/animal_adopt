class RenameTypeToCats < ActiveRecord::Migration[5.1]
  def change
    rename_column :cats, :type, :animal_type
  end
end
