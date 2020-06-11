class Extwebsite < ApplicationRecord
  has_many :extwebsite_fonts
  has_many :fonts, through: :extwebsite_fonts
end
