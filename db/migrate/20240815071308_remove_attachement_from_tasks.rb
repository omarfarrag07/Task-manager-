class RemoveAttachementFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :attachement, :string
  end
end
