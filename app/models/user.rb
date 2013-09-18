class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable, #:recoverable,
          :rememberable, :trackable, :validatable
	attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :first_name, :last_name, :provider, :uid, :as => [:default, :admin]

	has_many :pins, :dependent => :destroy

end
