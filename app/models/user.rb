class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :account, presence: true, uniqueness: true
  validates :password, confirmation: true

  has_secure_password 


end
