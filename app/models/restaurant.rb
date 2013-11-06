class Restaurant < ActiveRecord::Base
  has_many :menus, dependent: :destroy
  has_attached_file :image,
      :styles         => { :medium => "300x300>", :thumb => "100x100>" },
      :storage        => :s3,
      :path           => "/restaurants/images/:id/:style/:basename.:extension",
      :s3_credentials => {
          bucket: ENV["AWS_BUCKET"],
          access_key_id: ENV["AWS_ACCESS_KEY_ID"],
          secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
      }

  validates :name, :description, presence: true
  validates :name, uniqueness: true

  def self.latest
    Restaurant.order(:updated_at).last
  end
end