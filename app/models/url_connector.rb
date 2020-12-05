class UrlConnector < ApplicationRecord
  belongs_to :user

  before_create :generate_short_url

  validates :long_url, presence: true
  validates :long_url, format: { with: URI::DEFAULT_PARSER.make_regexp(['http', 'https']), message: 'Invalid ' }

  private

    def generate_short_url
      self.short_url = ShortUrlGenerator.perform
      generate_short_url if self.class.exists?(short_url: self.short_url)
    end
end
