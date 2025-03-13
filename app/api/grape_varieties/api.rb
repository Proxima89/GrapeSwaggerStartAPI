module GrapeVarieties
  class API < Grape::API
    helpers JSONAPI::Pagination, JSONAPI::Filtering

    prefix "api"
    version "v1", using: :path
    content_type :jsonapi, "application/vnd.api+json"

    formatter :jsonapi, Grape::Formatter::Jsonapi
    format :jsonapi

    resource :grape_varieties do
      desc "All Grapes" do
        success GrapeVarietySerializer
        produces [ "application/vnd.api+json" ]
        consumes [ "application/vnd.api+json" ]
      end
      params do
        optional :page, type: Hash do
          optional :number, type: String
        end
      end

      get do
        allowed = [ :title ]

        filtered = jsonapi_filter(GrapeVariety.all, allowed)
        grape_varieties = jsonapi_paginate(filtered.result)

        links = jsonapi_pagination(grape_varieties)
        links[:self] = request.base_url + CGI.unescape(request.fullpath)

        render grape_varieties.to_a, {
          meta: { pagination: jsonapi_pagination_meta(grape_varieties) },
          links:
        }
      end
    end
  end
end
