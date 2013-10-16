class Restaurant < ActiveRecord::Base

  validates :name, :description, :image_url, presence: true
  validates :name, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with:     %r{\.(gif|jpg|png)\Z}i,
    message:  'must be a URL for GIF, JPG or PNG image.'
  }
end
