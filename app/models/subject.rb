class Subject < ActiveRecord::Base
  attr_accessible :code, :courses, :name
  has_many :courses, :inverse_of => :subject

  def to_s
    self.name
  end

  def courses_where(options)
    self.courses.select { |course| course.level == options[:level] }
  end



end

# == Schema Information
#
# Table name: subjects
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  code       :string(255)
#  course_id  :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

