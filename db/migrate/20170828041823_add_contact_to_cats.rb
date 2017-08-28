class AddContactToCats < ActiveRecord::Migration[5.1]
  def change
    add_column :cats, :contact, :string
  end
end
