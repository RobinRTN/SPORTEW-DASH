class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :first_name, :last_name, :billing_address, :billing_city, :billing_country

  validates :first_name, :last_name, :billing_address, :billing_city, presence: true
  validates :sport_ids, presence: { message: "Vous devez sélectionner au moins un sport" }

  has_many :user_sports
  has_many :sports, through: :user_sports

end
