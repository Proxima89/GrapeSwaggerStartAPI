require "grape-swagger"

module API
  class Root < Grape::API
    prefix :api

    mount Vineyards::API

    add_swagger_documentation(
      info: {
        title: "Farmland API Endpoints."
      }
    )
  end
end
