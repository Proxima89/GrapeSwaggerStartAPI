module Vineyards
  class API < Grape::API
    helpers JSONAPI::Pagination, JSONAPI::Filtering

    prefix "api"
    version "v1", using: :path
    content_type :jsonapi, "application/vnd.api+json"

    formatter :jsonapi, Grape::Formatter::Jsonapi
    format :jsonapi

    resource :vineyards do
      mount GrapeVarieties::API

      desc "All Vineyards" do
        success VineyardSerializer
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
        filtered = jsonapi_filter(Vineyard.all, allowed)
        vineyards = jsonapi_paginate(filtered.result)

        links = jsonapi_pagination(vineyards)
        links[:self] = request.base_url + CGI.unescape(request.fullpath)

        render vineyards.to_a, {
          meta: { pagination: jsonapi_pagination_meta(vineyards) },
          links:
        }
      end
    end
  end
end
