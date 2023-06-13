class User < ApplicationRecord
   has_secure_password
   validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 20}
   validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }

end
#u = User.new(username:'nate', email:'nate@gmail.com',password:'password',password_confirmation:'password')