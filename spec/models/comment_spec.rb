require 'spec_helper'

describe Comment do
  it { should respond_to :content }
  it { should respond_to :user }
  it { should respond_to :course }
  it { should belong_to :user  }
  it { should belong_to :course }
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

