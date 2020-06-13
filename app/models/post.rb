class Post < ApplicationRecord
  has_many :post_fonts
  has_many :fonts, through: :post_fonts
  has_many :post_vibes
  has_many :vibes, through: :post_vibes
  accepts_nested_attributes_for :fonts, reject_if: proc { |attributes| attributes['name'].blank? }
  has_one_attached :photo
  is_impressionable
  acts_as_taggable_on :tags

  $tags = ['tech', 'classic', 'experimental', 'rising', 'trending']

  include PgSearch::Model

  multisearchable against: [:website]

  pg_search_scope :global_search,
  against: [:website],
  associated_against: {
    tags: [:name]
  },
  using: {
    tsearch: {prefix: true}
  }
  scope :is_free, -> { joins(:fonts).where(fonts: { free_commercial: true } ) }

  def posts_by_font(name)
    Post.joins(:fonts)
        .where(fonts: { name: name })
  end
end
