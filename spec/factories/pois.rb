FactoryGirl.define do
  factory :poi, class: Poi do
    name { Faker::Address.city }
    description { Faker::Lorem.paragraph(2, true, 4) }
    lonlat do
      factory.point(
        Faker::Address.longitude,
        Faker::Address.latitude
      )
    end
  end

end
