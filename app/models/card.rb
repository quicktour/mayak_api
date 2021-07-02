class Card < ApplicationRecord
  validates_presence_of :imt_id
  validates_presence_of :product_name
end
