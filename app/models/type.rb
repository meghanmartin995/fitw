class Type < ApplicationRecord
  has_many :font_types
  has_many :fonts, through: :font_types
end
