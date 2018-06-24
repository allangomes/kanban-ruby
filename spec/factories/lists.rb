FactoryBot.define do
  factory :list_bands, class: List do
    association :board, strategy: :find_or_create, title: 'project 1'
    title 'Rock Bands'
  end

  factory :list_movies, class: List do
    association :board, strategy: :find_or_create, title: 'project 1'
    title 'Movies'
  end
end
