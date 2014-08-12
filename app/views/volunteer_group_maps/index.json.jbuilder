json.array!(@volunteer_group_maps) do |volunteer_group_map|
  json.extract! volunteer_group_map, :id, :group_id, :volunteer_id, :join_at, :is_leader
  json.url volunteer_group_map_url(volunteer_group_map, format: :json)
end
