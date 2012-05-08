require 'spec_helper'

describe User do
	describe "user attributes" do
		it { should have_many :courses }
		it { should have_many(:bookmarks).class_name("Course") }
		it { should respond_to :name }
		it { should respond_to :email }
    it { should validate_presence_of(:email) }
		it { should respond_to :type }
		#  password
		it { should respond_to :password_digest }
    it { should validate_presence_of :password_digest}
	end
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

