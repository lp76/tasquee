require 'test_helper'

class AppointmentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Appointment.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Appointment.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Appointment.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to appointment_url(assigns(:appointment))
  end

  def test_edit
    get :edit, :id => Appointment.first
    assert_template 'edit'
  end

  def test_update_invalid
    Appointment.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Appointment.first
    assert_template 'edit'
  end

  def test_update_valid
    Appointment.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Appointment.first
    assert_redirected_to appointment_url(assigns(:appointment))
  end

  def test_destroy
    appointment = Appointment.first
    delete :destroy, :id => appointment
    assert_redirected_to appointments_url
    assert !Appointment.exists?(appointment.id)
  end
end
