class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :type
      t.integer :age
      t.integer :sex
      t.integer :city
      t.text :description
      t.boolean :neuter
      t.boolean :vaccine
      t.boolean :adopt
      t.datetime :adopt_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
