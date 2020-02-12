require 'test_helper'

class SightingsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get sightings_show_url
    assert_response :success
  end

  test "should get new" do
    get sightings_new_url
    assert_response :success
  end

  test "should get edit" do
    get sightings_edit_url
    assert_response :success
  end

end
