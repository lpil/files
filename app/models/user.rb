class User < ActiveRecord::Base
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :project_memberships
  has_many :projects,
           through: :project_memberships
end
