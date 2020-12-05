require 'test_helper'

class UrlConnectorTest < ActiveSupport::TestCase
  def test_new_url_connector_has_valid_short_url
    url_connector = UrlConnector.create(user: users(:one), long_url: 'http://example.com')

    short_url = URI.parse(url_connector.short_url)

    assert_not_nil url_connector.short_url
    assert_equal 'localhost', short_url.host
    assert_equal 7, short_url.path.length
  end
end
