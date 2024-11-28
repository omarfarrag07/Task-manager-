class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.string :category
      t.string :title
      t.text :description
      t.string :status
      t.string :attachment

      t.timestamps
    end
  end
end
