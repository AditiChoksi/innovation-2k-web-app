require 'test_helper'

class EnrollmentsControllerTest < ActionController::TestCase
  setup do
    @enrollment = enrollments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enrollments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enrollment" do
    assert_difference('Enrollment.count') do
      post :create, enrollment: { amt_paid: @enrollment.amt_paid, college: @enrollment.college, contact_no: @enrollment.contact_no, dept: @enrollment.dept, event_name: @enrollment.event_name, name: @enrollment.name, receipt_no: @enrollment.receipt_no, team: @enrollment.team, volunteer_id: @enrollment.volunteer_id, year: @enrollment.year }
    end

    assert_redirected_to enrollment_path(assigns(:enrollment))
  end

  test "should show enrollment" do
    get :show, id: @enrollment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enrollment
    assert_response :success
  end

  test "should update enrollment" do
    patch :update, id: @enrollment, enrollment: { amt_paid: @enrollment.amt_paid, college: @enrollment.college, contact_no: @enrollment.contact_no, dept: @enrollment.dept, event_name: @enrollment.event_name, name: @enrollment.name, receipt_no: @enrollment.receipt_no, team: @enrollment.team, volunteer_id: @enrollment.volunteer_id, year: @enrollment.year }
    assert_redirected_to enrollment_path(assigns(:enrollment))
  end

  test "should destroy enrollment" do
    assert_difference('Enrollment.count', -1) do
      delete :destroy, id: @enrollment
    end

    assert_redirected_to enrollments_path
  end
end
