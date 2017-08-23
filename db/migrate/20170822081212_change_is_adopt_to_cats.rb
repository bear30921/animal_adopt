class ChangeIsAdoptToCats < ActiveRecord::Migration[5.1]
  def change
    change_column :cats, :is_adopt, :string
  end
end
