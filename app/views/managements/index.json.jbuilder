# json.array! @managements, partial: "managements/management", as: :management
json.array!(@managements) do |management|
  json.title event.title
  json.url management_url(management, format: :html) 
end