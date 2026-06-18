class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.string :code, null: false
      t.string :description, null: false
      t.boolean :admin, null: false, default: false
      t.boolean :user, null: false, default: false

      t.timestamps
    end

    add_index :roles, :code, unique: true
  end
end