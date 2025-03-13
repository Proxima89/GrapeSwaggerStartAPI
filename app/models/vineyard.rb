class Vineyard < ApplicationRecord
  has_many :grape_varieties, dependent: :destroy
end
