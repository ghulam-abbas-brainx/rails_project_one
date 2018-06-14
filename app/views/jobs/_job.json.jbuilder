json.extract! job, :id, :title, :description, :opening_date, :closing_date, :created_at, :updated_at
json.url job_url(job, format: :json)
