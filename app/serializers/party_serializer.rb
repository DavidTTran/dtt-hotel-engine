class PartySerializer
  include JSONAPI::Serializer
  attributes :name
  has_many :characters
end
