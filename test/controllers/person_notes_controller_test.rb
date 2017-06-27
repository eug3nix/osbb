require 'test_helper'

class PersonNotesControllerTest < ActionController::TestCase
  setup do
    @person_note = person_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:person_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person_note" do
    assert_difference('PersonNote.count') do
      post :create, person_note: { person_id: @person_note.person_id, text: @person_note.text }
    end

    assert_redirected_to person_note_path(assigns(:person_note))
  end

  test "should show person_note" do
    get :show, id: @person_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person_note
    assert_response :success
  end

  test "should update person_note" do
    patch :update, id: @person_note, person_note: { person_id: @person_note.person_id, text: @person_note.text }
    assert_redirected_to person_note_path(assigns(:person_note))
  end

  test "should destroy person_note" do
    assert_difference('PersonNote.count', -1) do
      delete :destroy, id: @person_note
    end

    assert_redirected_to person_notes_path
  end
end
