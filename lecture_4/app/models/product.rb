class Product < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_numericality_of :cents

  has_many :variations
  has_and_belongs_to_many :categories
end
