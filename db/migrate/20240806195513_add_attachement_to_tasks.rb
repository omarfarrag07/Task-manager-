class AddAttachementToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :attachement, :string
  end
end
