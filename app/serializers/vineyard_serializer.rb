class VineyardSerializer < BaseSerializer
  include JSONAPI::Serializer

  has_many :grape_varieties

  attributes :name, :location, :size, :age, :soil_type, :owner, :season, :irrigation, :weather

  attribute :created_at do |object|
    object.created_at.iso8601
  end

  attribute :updated_at do |object|
    object.updated_at.iso8601
  end
end
