json.array!(@items) do |item|
  json.extract! item, :name, :original_name, :content, :size, :download_count, :expires_at, :password_digest, :message, :content_type
  json.url item_url(item, format: :json)
end
