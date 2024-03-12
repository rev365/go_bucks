class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def name = email
  def admin?() = email.include?('admin')

  scope :search, ->(q) { where(table[:email].matches("%#{q}%")) }
end
