require "application_system_test_case"

class ResponsesTest < ApplicationSystemTestCase
  setup do
    @response = responses(:one)
  end

  test "visiting the index" do
    visit responses_url
    assert_selector "h1", text: "Responses"
  end

  test "creating a Rersonse" do
    visit responses_url
    click_on "New Rersonse"

    fill_in "Description", with: @response.description
    fill_in "Link", with: @response.link
    fill_in "Post", with: @response.post_id
    fill_in "User", with: @response.user_id
    click_on "Create Rersonse"

    assert_text "Rersonse was successfully created"
    click_on "Back"
  end

  test "updating a Rersonse" do
    visit responses_url
    click_on "Edit", match: :first

    fill_in "Description", with: @response.description
    fill_in "Link", with: @response.link
    fill_in "Post", with: @response.post_id
    fill_in "User", with: @response.user_id
    click_on "Update Rersonse"

    assert_text "Rersonse was successfully updated"
    click_on "Back"
  end

  test "destroying a Rersonse" do
    visit responses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rersonse was successfully destroyed"
  end
end
