class Category < ApplicationRecord
  has_many :font_categories
  has_many :fonts, through: :font_categories
end
