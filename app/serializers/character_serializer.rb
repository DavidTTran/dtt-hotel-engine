class CharacterSerializer
  include JSONAPI::Serializer
  attributes :name, :level, :character_class, :party_id
end
