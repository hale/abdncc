require 'spec_helper'

describe User do
	# in order for unique validation of email to work - a factory isn't enough
	before(:each) { User.create!(:email => "emailvalidations@example.com",
															 :password => 'foobar') 
								}

	let(:user_min) { FactoryGirl.create(:user_min) }


	it { should have_and_belong_to_many :courses }
	it { should have_many(:bookmarks).class_name("Course") }
	
	describe "user attributes" do
		it { should respond_to :name }
		it { should respond_to :email }
		it { should respond_to :status }
		it { should respond_to :password_digest }
	end

	describe "default values" do
		before { user_min.save }
		subject { user_min }
		its(:name) { should == "Anonymous"}
	end

	describe "validations" do
	  it { should validate_presence_of(:email) }
	  it { should validate_presence_of :password_digest}
	  it { should ensure_length_of(:password).
	  							is_at_least(6).
	  							is_at_most(20) }

	  ["abc", "@abc.com", "a@!d.com", "a@a.c0m", "a@@ex.com"].each do |addr|
	  	it { should_not allow_value( addr ).for(:email) }
	  end
	  
	  ["example@example.com", "1a@a.com", "a@2a.net", "al+al@al.com"].each do |addr|
	  	it { should allow_value( addr ).for(:email) }
		end

		it { should validate_uniqueness_of(:email) }

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

