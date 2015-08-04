class Product < ActiveRecord::Base

  #   method :model_field
  #   validates is a standard method which will act on model_fields. Presence is a condition

  # validate these three fields have values in them
  validates :title, :description, :image_url, presence: true
  # validate price is a positive value of >= 1 cent
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
#   validate title is unique
#   initially: validates :true, uniqueness: true
#   I wanted to add case sensitive because it failed for me when I tested it
  validates :title, uniqueness: { case_sensitive: false}

#   validates image_url ends in an image type extension
#   the allow_blank option is used to avoid multiple error messages at once
  validates :image_url, allow_blank: true, format: {
      with:   %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG, or PNG image.'
    }

end
