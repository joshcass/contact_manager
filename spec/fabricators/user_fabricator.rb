Fabricator(:user) do
  name "Han Solo"
  image "www.picture.com"
  provider "twitter"
  uid {Fabricate.sequence(:uid)}
end
