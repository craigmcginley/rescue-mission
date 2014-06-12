class User < ActiveRecord::Base

  validates :username, :password, presence: true
  validates :username, uniqueness: true

  has_many :questions
  has_many :answers
  has_many :answers, through: :questions

end
