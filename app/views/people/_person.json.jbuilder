json.extract! person, :id, :empid, :name, :lastname, :phone, :login, :password, :created_at, :updated_at
json.url person_url(person, format: :json)
