FactoryBot.define do
  factory :card_bands, class: Card do
    association :board, strategy: :find_or_create, title: 'project 1'
    association :list, factory: :list_bands, strategy: :find_or_create, title: 'Rock Bands'

    factory :angra do
      title 'Angra'
    end

    factory :pink_floyd do
      title 'Pink Floyd'
    end
  end

  factory :card_movies, class: Card do
    association :board, strategy: :find_or_create, title: 'project 1'
    association :list, factory: :list_bands, strategy: :find_or_create, title: 'Movies'

    factory :interestellar do
      title 'Interestellar'
    end
  end

  # factory :rock_bands, class: Card do
  #   association :board, strategy: :find_or_create
  #   association :list, factory: :list_bands, strategy: :find_or_create

  #   factory :pink_floyd do
  #     title 'Pink Floyd'
  #   end

  #   factory :angra do
  #     title 'Angra'
  #   end

  #   factory :rhapsody do
  #     title 'Rhapsody'
  #   end
  # end

  # factory :movies, class: Card do
  #   association :board, strategy: :find_or_create
  #   association :list, factory: :list_movies, strategy: :find_or_create

  #   factory :interestellar do
  #     title 'Interestellar'
  #   end

  #   factory :star_wars do
  #     title 'Star Wars'
  #   end
  # end
end
