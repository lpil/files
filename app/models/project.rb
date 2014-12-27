class Project < ActiveRecord::Base
  has_many :project_memberships
  has_many :users, through: :project_memberships

  belongs_to :owner,
             class_name: 'User'

  # We always want the newest shouts first
  default_scope { order 'updated_at DESC' }
end
