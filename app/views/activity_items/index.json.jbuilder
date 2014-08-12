json.array!(@activity_items) do |activity_item|
  json.extract! activity_item, :id, :activity_id, :volunteer_id, :is_finish, :remark
  json.url activity_item_url(activity_item, format: :json)
end
