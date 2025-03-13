require "spec_helper"

RSpec.describe "/api/v1/vineyards/grape_varieties" do
  describe "GET /api/v1/vineyards/grape_varieties" do
    it "returns a list of grape varieties" do
      fixture_vineyards = load_fixture("vineyards")
      fixture_grape_varieties = load_fixture("grape_varieties")

      fixture_vineyards["vineyards"].each do |vino_data|
        vineyard = Vineyard.create!(vino_data)

        fixture_grape_varieties["grape_varieties"].each do |grape_data|
          GrapeVariety.create!(grape_data.merge(vineyard_id: vineyard.id))
        end
      end

      get "api/v1/vineyards/grape_varieties"

      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Muscat")
      expect(last_response.content_type).to eq("application/vnd.api+json")
    end
  end
end
