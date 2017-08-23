class AddAvatarColumnsToCats < ActiveRecord::Migration[5.1]

  def up
    add_attachment :cats, :avatar
  end

  def down
    remove_attachment :cats, :avatar
  end

end
