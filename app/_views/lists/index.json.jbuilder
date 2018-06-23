json.data do |json|
  json.array! @board.lists, partial: 'lists/list', as: :list
end
