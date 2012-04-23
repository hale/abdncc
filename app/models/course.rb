class Course < ActiveRecord::Base
  attr_accessible :assessment, :ccode, :coordinator, :credits, :department, :description, :level, :name, :note, :prereq, :subject
end
