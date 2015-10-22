require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "validates presence before saving" do
  	job = Job.new

  	assert_not job.save
  end

  test "validates valid object saves" do
  	job = Job.new(title: "Object Title", description: "Object description")

  	assert job.save
  end
end
