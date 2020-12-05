require 'test_helper'

class UrlConnectorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url_connector = url_connectors(:one)
  end

  test "should get index" do
    get url_connectors_url
    assert_response :success
  end

  test "should get new" do
    get new_url_connector_url
    assert_response :success
  end

  test "should create url_connector" do
    assert_difference('UrlConnector.count') do
      post url_connectors_url, params: { url_connector: { long_url: @url_connector.long_url, short_url: @url_connector.short_url } }
    end

    assert_redirected_to url_connector_url(UrlConnector.last)
  end

  test "should show url_connector" do
    get url_connector_url(@url_connector)
    assert_response :success
  end

  test "should get edit" do
    get edit_url_connector_url(@url_connector)
    assert_response :success
  end

  test "should update url_connector" do
    patch url_connector_url(@url_connector), params: { url_connector: { long_url: @url_connector.long_url, short_url: @url_connector.short_url } }
    assert_redirected_to url_connector_url(@url_connector)
  end

  test "should destroy url_connector" do
    assert_difference('UrlConnector.count', -1) do
      delete url_connector_url(@url_connector)
    end

    assert_redirected_to url_connectors_url
  end
end
