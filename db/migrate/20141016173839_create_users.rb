class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :project_starter

      t.timestamps
    end
    add_index :users, :email, unique: { case_sensitive: false }
  end
end
