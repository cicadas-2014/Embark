FactoryGirl.define do
  # will create fake adventures for tests
  factory :adventure do
      name 'an adventure'
      description "this describes adventure"
      map_url "map.png"
      image_url "image.png"
      city "NYC"
  end
end
