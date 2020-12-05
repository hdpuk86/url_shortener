class UrlConnector < ApplicationRecord
  validates :long_url, presence: true
end
