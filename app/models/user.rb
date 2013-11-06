class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:recoverable,
          :rememberable, :trackable, :validatable
	attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :provider, :uid, :as => [:default, :admin]

	has_many :pins, :dependent => :destroy
	
	validates :name, presence: true
	
	acts_as_followable
	acts_as_follower

end
