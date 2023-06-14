class User < ApplicationRecord
   has_secure_password
   validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 20}
   validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }

   has_many :posts

   #has_one_attached :avatar
   #after_commit :add_default_avatar, on: %i[create update]
   # check out vid 4 of turbochat tutorial
   
=begin   
   private
   def add_default_avatar
      return if avatar.attached?

      avatar.attach(
         io: File.open(Rails.root.join('app','assets','images','default_profile.jpeg')),
         filename: 'default_profile.jpeg',
         content_type: 'image/jpeg'
      )
=end
end

#u = User.new(username:'nate', email:'nate@gmail.com',password:'password',password_confirmation:'password')