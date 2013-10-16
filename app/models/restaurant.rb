class Restaurant < ActiveRecord::Base
  has_many :menus, dependent: :destroy

  validates :name, :description, :image_url, presence: true
  validates :name, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with:     %r{\.(gif|jpg|png)\Z}i,
    message:  'must be a URL for GIF, JPG or PNG image.'
  }

  def self.latest
    Restaurant.order(:updated_at).last
  end
end