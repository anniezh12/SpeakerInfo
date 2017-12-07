require 'test_helper'

class ForumControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string,location:string,number_of_speakers:integer" do
    get forum_name:string,location:string,number_of_speakers:integer_url
    assert_response :success
  end

end
