require "application_system_test_case"

class UrlConnectorsTest < ApplicationSystemTestCase
  setup do
    @url_connector = url_connectors(:one)
  end

  test "visiting the index" do
    visit url_connectors_url
    assert_selector "h1", text: "Url Connectors"
  end

  test "creating a Url connector" do
    visit url_connectors_url
    click_on "New Url Connector"

    fill_in "Long url", with: @url_connector.long_url
    fill_in "Short url", with: @url_connector.short_url
    click_on "Create Url connector"

    assert_text "Url connector was successfully created"
    click_on "Back"
  end

  test "updating a Url connector" do
    visit url_connectors_url
    click_on "Edit", match: :first

    fill_in "Long url", with: @url_connector.long_url
    fill_in "Short url", with: @url_connector.short_url
    click_on "Update Url connector"

    assert_text "Url connector was successfully updated"
    click_on "Back"
  end

  test "destroying a Url connector" do
    visit url_connectors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Url connector was successfully destroyed"
  end
end
