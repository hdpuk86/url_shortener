require 'test_helper'

class UrlConnectorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @current_user = users(:one)
    @url_connector = url_connectors(:one)
    @unauthorised_url_connector = url_connectors(:two)
    sign_in @current_user
  end

  test "should get index" do
    get url_connectors_url
    assert_response :success
  end

  test "should only show authorised urls on index" do
    get url_connectors_url
    assert_select 'td', text: @url_connector.short_url, count: 1
    assert_select 'td', text: @unauthorised_url_connector.short_url, count: 0
  end

  test "should get new" do
    get new_url_connector_url
    assert_response :success
  end

  test "should create url_connector" do
    assert_difference('UrlConnector.count') do
      post url_connectors_url, params: { url_connector: { long_url: @url_connector.long_url, short_url: @url_connector.short_url } }
    end

    assert_redirected_to url_connectors_url
  end

  test "created url_connector should belong to the current user" do
    assert_difference('UrlConnector.count') do
      post url_connectors_url, params: { url_connector: { long_url: @url_connector.long_url, short_url: @url_connector.short_url } }
    end

    assert_equal @current_user, UrlConnector.last.user
  end

  test "should destroy url_connector" do
    assert_difference('UrlConnector.count', -1) do
      delete url_connector_url(@url_connector)
    end

    assert_redirected_to url_connectors_url
  end

  test "should not destroy url_connector if unauthorised" do
    assert_no_difference('UrlConnector.count') do
      delete url_connector_url(@unauthorised_url_connector)
    end

    assert_redirected_to url_connectors_url
    assert_equal 'URL could not be found.', flash.alert
  end
end
