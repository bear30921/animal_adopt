class Cat < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_by, through: :favorites, source: :user 

  has_attached_file :avatar, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_presence_of :avatar, :name, :age, :city, :description
  

  def gender(gender)
    if gender == 1
      "男"
    else
      "女"
    end
  end


end
