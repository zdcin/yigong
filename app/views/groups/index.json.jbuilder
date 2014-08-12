json.array!(@groups) do |group|
  json.extract! group, :id, :name, :remark, :start_at, :finish_at
  json.url group_url(group, format: :json)
end
