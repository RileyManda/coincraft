class User < ApplicationRecord
  self.table_name = 'users'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :transactions
  has_many :categories, through: :transactions
  has_many :categories, foreign_key: 'author_id'
  # validates :email, presence: true, uniqueness: true
end
