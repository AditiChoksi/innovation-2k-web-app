json.array!(@enrollments) do |enrollment|
  json.extract! enrollment, :id, :receipt_no, :name, :college, :contact_no, :team, :year, :dept, :amt_paid, :event_name, :volunteer_id
  json.url enrollment_url(enrollment, format: :json)
end
