json.data do |json|
  json.array! @boards, :id, :title, :description
end
