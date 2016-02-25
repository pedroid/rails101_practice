class CreateMGroups < ActiveRecord::Migration
  def change
    create_table :m_groups do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
