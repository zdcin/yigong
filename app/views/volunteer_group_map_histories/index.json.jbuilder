json.array!(@volunteer_group_map_histories) do |volunteer_group_map_history|
  json.extract! volunteer_group_map_history, :id, :group_id, :volunteer_id, :join_at, :quit_at, :is_leader
  json.url volunteer_group_map_history_url(volunteer_group_map_history, format: :json)
end
