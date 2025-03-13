class GrapeVarietySerializer < BaseSerializer
  include JSONAPI::Serializer

  belongs_to :vineyard

  attributes :grape_type, :pesticides, :care, :age, :sugar_level, :flavor_profile, :planting_density, :stage, :irrigation

  attribute :created_at do |object|
    object.created_at.iso8601
  end

  attribute :updated_at do |object|
    object.updated_at.iso8601
  end
end
