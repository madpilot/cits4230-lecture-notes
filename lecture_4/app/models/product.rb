class Product < ActiveRecord::Base
  validates_presence_of :number
  validates_presence_of :description
  validates_numericality_of :cents

  has_many :variations
end
