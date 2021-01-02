FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.sentence }
    association :user
    association :map_place

    after(:build) do |comment|
      comment.image.attach(io: File.open('public/images/testimage.jpeg'), filename: 'testimage.jpeg')
    end
  end
end
