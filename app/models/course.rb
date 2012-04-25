class Course < ActiveRecord::Base
  attr_accessible :assessment, :ccode, :coordinator, :credits, :department, :description, :level, :name, :note, :prereq, :subject
  belongs_to :subject
  
end

# == Schema Information
#
# Table name: courses
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  ccode       :string(255)
#  credits     :integer
#  coordinator :string(255)
#  prereq      :string(255)
#  note        :text
#  description :text
#  assessment  :text
#  level       :integer
#  department  :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  subject_id  :integer
#

