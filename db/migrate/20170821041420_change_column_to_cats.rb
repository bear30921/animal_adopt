class ChangeColumnToCats < ActiveRecord::Migration[5.1]
  def change
    rename_column :cats, :neuter, :is_neuter
    rename_column :cats, :vaccine, :is_vaccine
    rename_column :cats, :adopt, :is_adopt
    remove_column :cats, :user_id
  end
end
