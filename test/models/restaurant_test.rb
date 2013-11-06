require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  fixtures :restaurants

  def new_restaurant(image_url)
    Restaurant.new( name: "Lorem ipsum",
                    description: "Japanese",
                    image_url: image_url)
  end

  test "Restaurant attributes must not be empty" do
    restaurant = Restaurant.new
    assert restaurant.invalid?
    assert restaurant.errors[:name].any?
    assert restaurant.errors[:description].any?
    assert restaurant.errors[:image_url].any?
  end

  test "Image_url must end in jpg, gif, or png" do
    valid = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    invalid = %w{ fred.doc fred.gif/more fred.gif.more }

    valid.each do |name|
      assert new_restaurant(name).valid?, "#{name} must be valid"
    end

    invalid.each do |name|
      assert new_restaurant(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "Restaurant name must be unique" do
    restaurant = Restaurant.new(  name:  restaurants(:micks).name,
                                  description: "Japanese",
                                  image_url:   "lorem.jpg")
    assert restaurant.invalid?
    assert_equal ["has already been taken"], restaurant.errors[:name]
  end
end
