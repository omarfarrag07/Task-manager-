json.extract! task, :id, :project_id, :category, :title, :description, :status, :attachment, :created_at, :updated_at
json.url task_url(task, format: :json)
