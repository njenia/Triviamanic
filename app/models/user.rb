class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :bootcamp_notice_cancelled
  # attr_accessible :title, :body

  has_many :quizzes
  has_many :player_group_users
  has_many :game_player_groups, :through => :player_group_users

end

