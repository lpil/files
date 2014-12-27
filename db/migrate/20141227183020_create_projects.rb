class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.belongs_to :owner, index: true

      t.timestamps null: false
    end

    create_table :project_memberships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
    end
  end
end
