json.extract! authorbook, :id, :author_id, :book_id, :created_at, :updated_at
json.url authorbook_url(authorbook, format: :json)
