class Restaurant < ActiveRecord::Base
  has_many :menus, dependent: :destroy
  has_attached_file :image,
      :styles         => { :medium => "300x300>", :thumb => "100x100>" }

  validates :name, :description, presence: true
  validates :name, uniqueness: true

  def self.latest
    Restaurant.order(:updated_at).last
  end
end