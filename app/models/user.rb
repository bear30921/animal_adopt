class User < ApplicationRecord



  has_many :cats, dependent: :destroy


  has_many :favorites, dependent: :destroy
  has_many :favorite_animal, through: :favorites, source: :cat

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
