require "spec_helper"

RSpec.describe "/api/v1/vineyards" do
  describe "GET /api/v1/vineyards" do
    it "returns a list of vineyards" do
      fixture_vineyards = load_fixture("vineyards")
      fixture_vineyards["vineyards"].each { |data| Vineyard.create!(data) }

      get "/api/v1/vineyards"

      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Bricco")
      expect(last_response.content_type).to eq("application/vnd.api+json")
    end
  end
end
