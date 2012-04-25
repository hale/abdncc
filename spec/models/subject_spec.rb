require 'spec_helper'

describe Subject do
  it { should  have_many(:courses).dependent(:destroy) }
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

