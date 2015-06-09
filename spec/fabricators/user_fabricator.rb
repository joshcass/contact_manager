Fabricator(:user) do
  name Faker::Name.name
  image Faker::Avatar.image
  provider "twitter"
  uid {Fabricate.sequence(:uid)}
end
