class Post < ApplicationRecord
  belongs_to :tag
  has_many :post_fonts
  has_many :fonts, through: :post_fonts
  has_many :post_vibes
  has_many :vibes, through: :post_vibes
  accepts_nested_attributes_for :fonts, reject_if: proc { |attributes| attributes['name'].blank? }
  has_one_attached :photo
  is_impressionable

  scope :tag, -> tag_id { where(:tag_id => tag_id) }

  scope :with_tag, lambda { |tags|
    where(tag: [*tag])
  }

  scope :with_tag_id, ->(tag_ids) {
    where(tag_id: [*tag_ids])
  }

  scope :with_country_name, ->(country_name) {
    where(country: { name: country_name }).joins(:country)
  }

  include PgSearch::Model
  # pg_search_scope :search_by_website,
  #   against: [ :website ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
  multisearchable against: [:website]

  pg_search_scope :global_search,
  against: [:website],
  associated_against: {
    tags: [:name]
  },
  using: {
    tsearch: {prefix: true}
  }
  def posts_by_font(name)
    Post.joins(:fonts)
        .where(fonts: { name: name })
  end

end
