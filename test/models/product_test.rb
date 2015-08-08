require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures  :products

  # test "the truth" do
  #   assert true
  # end

  # test attributes have values in them
  test 'product attributes must not be empty' do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  # test price greater than 1 cent
  test 'product price must be positive' do
    product = Product.new(title:    'Osprey Backpack',
                          description: '75 liters, blue, and awesome',
                        image_url:  'tent.jpg')
    product.price = -1
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'],
      product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'],
      product.errors[:price]

    product.price = 1
    assert product.valid?
  end

#   test image_url ends with image extension
  def new_product(image_url)
    Product.new(title:    "Osprey Backpack",
      description: "75 liters, blue, and awesome",
      price:    120.00,
      image_url:  image_url)
  end
  test "image_url is image" do
    ok = %w{fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/zfred.gif}
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    ok.each do |name|
      assert new_product(name).valid?, "#{name} should be valid"
    end
    bad.each do |name|
      assert new_product(name).valid?, "#{name} should not be valid"
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(title:    products(:ruby).title,
      description:  "ya ya ya ya",
      price:      1000000,
      image_url:  "Merica.jpg")

    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

end
