class Task < ApplicationRecord
  belongs_to :project
  # ToDo
  belongs_to :user, optional: true
  validates :status, inclusion: { in: %w[new in_progress resolved closed] }
  validates :project_id, presence: true
  mount_uploader :attachment, AttachementUploader
end
