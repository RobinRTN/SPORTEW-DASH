class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :first_name, :last_name, :billing_address, :billing_city, :billing_country

  
  has_many :user_sports
  has_many :sports, through: :user_sports

end
