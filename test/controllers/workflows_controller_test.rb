require 'test_helper'

class WorkflowsControllerTest < ActionController::TestCase
  test "should get create form" do
    get :new

    assert_response :success
  end

  test "should get edit form" do
    workflow = create(:workflow)

    get :edit, :id => workflow.id

    assert_response :success
  end

  test "should create workflow" do
    user = create(:user)
    sign_in user

    post :create, :workflow => {:document => fixture_file_upload('files/various_type_outputs.t2flow',
                                                                 'application/octet-stream') }

    assert_redirected_to assigns(:workflow)
    assert_empty assigns(:workflow).errors
  end

  test "should update workflow" do
    workflow = create(:workflow)
    sign_in workflow.user

    patch :update, :id => workflow.id, :workflow => {:title => 'New title'}

    assert_redirected_to workflow_url(workflow)
    assert_equal 'New title', assigns(:workflow).title
  end

  test "should delete workflow" do
    workflow = create(:workflow)
    sign_in workflow.user

    delete :destroy, :id => workflow.id

    assert_redirected_to workflows_url
  end

end