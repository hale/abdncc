class User < ActiveRecord::Base
  has_secure_password

  has_many :courses
  has_many :bookmarks, :class_name => 'Course'
  attr_accessible :email, :name, :password, :password_digest, :status

  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
end

# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  type            :string(255)
#  password_digest :string(255)
#  courses_id      :integer
#  bookmarks_id    :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  status          :string(255)
#

