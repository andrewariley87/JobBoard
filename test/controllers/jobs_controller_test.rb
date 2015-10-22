require 'test_helper'

class JobsControllerTest < ActionController::TestCase

	test "that the index returns the list of all jobs" do
		get :index

		refute_nil assigns[:jobs]
		assert_response :success
	end

	test "job creates successfully" do
		post :create, { job: {title: "test title", description: "test description"} }

		job = assigns[:job]

		assert_equal job.title, "test title"
		assert_equal job.description, "test description"
		assert_redirected_to jobs_path
	end

	test "job doesn't create successfully because there is no title" do
		post :create, { job: {title: "", description: "test description"} }

		job = assigns[:job]

		refute job.valid?
		assert_template :new
	end

  test "job doesn't create successfully because there is no description" do
    post :create, { job: {title: "test title", description: ""} }

    job = assigns[:job]

    refute job.valid?
    assert_template :new
  end

	test "show method" do
		record = jobs(:one)
		#send the request
		get :show, id: record.id

		#create local variable and assign it the job instance variable that is in the show method
		job = assigns[:job]

		#make sure that the record is not nil
		refute_nil job

		#make sure that the status code is in the 200 range, and the response was successful
		assert_response :success
	end

end
