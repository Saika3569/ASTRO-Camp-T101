class User < ApplicationRecord

  has_many :tasks, dependent: :destroy
  validates :email, presence: true, uniqueness: true , format:  /\A[^@]+@[^@]+\z/
  validates :password, confirmation: true
  has_secure_password 


end
