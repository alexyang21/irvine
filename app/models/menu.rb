class Menu < ActiveRecord::Base
  belongs_to :restaurant
  has_many :items

  before_destroy :ensure_not_referenced_by_any_item

  validates :name, :price, presence: true
  validates :price, numericality: {
            greater_than_or_equal_to: 0.01,
            less_than_or_equal_to:    1000}

  private
    def ensure_not_referenced_by_any_item
      if items.empty?
        return true
      else
        errors.add(:base, 'Items still present in customer carts')
        return false
      end
    end
end
