require "test_helper"

class AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get announcements_new_url
    assert_response :success
  end

  test "should get unviewed" do
    get announcements_unviewed_url
    assert_response :success
  end

  test "should get my_posts" do
    get announcements_my_posts_url
    assert_response :success
  end
end
