json.extract! tiny_url, :id, :user_id, :slug, :url, :enabled, :created_at, :updated_at
json.url tiny_url_url(tiny_url, format: :json)
