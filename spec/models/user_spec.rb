require 'spec_helper'

describe User do
	# in order for unique validation of email to work - a factory isn't enough
	before(:each) { User.create!(:email => "emailvalidations@example.com",
															 :password => 'foobar') 
								}

	let(:user_min) { FactoryGirl.create(:user_min) }
	let(:user_full) { FactoryGirl.create( :user ) }


	it { should have_and_belong_to_many :courses }
	it { should have_many(:bookmarks).class_name("Course") }

	describe "course related methods" do
		let(:course) { FactoryGirl.create( :course ) }

		describe "the has_course? method" do
			subject { user_full }
			it { should respond_to :has_course? }

			context "user has the course in their course list" do
				before { user_full.courses << course  }

				it "should return true" do
					user_full.has_course?( course ).should be_true
				end

				# after { user_full.courses.delete course }
				after { user_full.remove_course course }
			end

			context "user does not have the course in their course list"
				it "should return false" do
					user_full.has_course?( course ).should be_false
				end
			end

		describe "the add course method" do
			subject { user_full }
			it { should respond_to :add_course }

			it "should add a the course to the user's course list" do
				user_full.add_course course
				user_full.courses.include?( course ).should be_true
			end
		end

		describe "the remove course method" do
			subject { user_full }
			it { should respond_to :remove_course }

			before { user_full.add_course course }

			it "should remove the course from the user's course list" do
				user_full.remove_course course
				user_full.has_course?( course ).should be_false
			end
		end


	end


	
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

