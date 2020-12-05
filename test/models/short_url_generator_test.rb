require 'test_helper'


class ShortUrlGeneratorTest < ActiveSupport::TestCase
  def test_can_perform
    assert_not_nil ShortUrlGenerator.perform
  end

  def test_perform_generates_a_url
    short_url = URI.parse(ShortUrlGenerator.perform)
    assert_equal 'localhost', short_url.host
    assert_equal 7, short_url.path.length
  end
end
