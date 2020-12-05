require 'test_helper'


class ShortUrlTest < ActiveSupport::TestCase
  def test_can_generate
    assert_not_nil ShortUrl.generate
  end

  def test_can_generate_url
    short_url = URI.parse(ShortUrl.generate)
    assert_equal 'localhost', short_url.host
    assert_equal 7, short_url.path.length
  end
end
