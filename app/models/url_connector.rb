class UrlConnector < ApplicationRecord
  belongs_to :user
  validates :long_url, presence: true
  validates :long_url, format: { with: URI::DEFAULT_PARSER.make_regexp(['http', 'https']), message: 'Invalid ' }
end
