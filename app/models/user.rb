class User < ActiveRecord::Base
  has_secure_password

  has_and_belongs_to_many :courses
  has_many :bookmarks, :class_name => 'Course'
  has_many :comments
  
  attr_accessible :email, :name, :status, :password, :status, :courses, :bookmarks

  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates :password, :length => { :in => 6..20 }
  validates_format_of :email, :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates_uniqueness_of :email

  attr_defaults :name => "Anonymous"

  def has_course?( course )
    self.courses.exists?( course ) ? true : false
  end

  def add_course( course )
    # if course.is_a? Course
      self.courses << course
    # elsif course.is_a? Fixnum
      # self.courses << Course.find( course )
    # end
  end

  def remove_course ( course )
    self.courses.delete course
  end
end

# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  course_id       :integer
#  bookmark_id     :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  status          :string(255)
#

