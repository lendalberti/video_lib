json.array!(@rules) do |rule|
  json.extract! rule, :id, :name, :badge_name, :video_name, :view_count
  json.url rule_url(rule, format: :json)
end
