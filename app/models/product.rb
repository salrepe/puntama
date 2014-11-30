class Product < ActiveRecord::Base
  belongs_to :category

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
end
