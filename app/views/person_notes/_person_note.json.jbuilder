json.extract! person_note, :id, :text, :person_id, :created_at, :updated_at
json.url person_note_url(person_note, format: :json)
