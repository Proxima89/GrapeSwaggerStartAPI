Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"

  get "up" => "rails/health#show", as: :rails_health_check

  mount API::Root => "/"
end
