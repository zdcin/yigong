json.array!(@volunteers) do |volunteer|
  json.extract! volunteer, :id, :cell_phone, :name, :mail, :birthday, :id_card_num, :address, :belief_start_at, :is_baptized, :baptized_day, :join_at, :quit_at, :skills
  json.url volunteer_url(volunteer, format: :json)
end
