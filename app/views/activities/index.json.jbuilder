json.array!(@activities) do |activity|
  json.extract! activity, :id, :name, :remark, :start_at, :finish_at
  json.url activity_url(activity, format: :json)
end
