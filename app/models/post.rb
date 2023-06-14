class Post < ApplicationRecord
  belongs_to :user

  validates :image, presence: true

  mount_uploader :image, ImageUploader
end

=begin
  validate :picture_size

  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5Mb")
    end
  end
=end