class Comment < ActiveRecord::Base
  attr_accessible :content, :course_id, :user_id
  belongs_to :course
  belongs_to :user
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  course_id  :integer
#  content    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

