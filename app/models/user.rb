class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	has_many :tickets
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable
end