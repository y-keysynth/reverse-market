json.extract! item, :id, :title, :details, :price, :user_id, :created_at, :updated_at
json.url item_url(item, format: :json)
