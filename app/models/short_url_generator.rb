class ShortUrlGenerator
  def self.perform
    host = Rails.application.routes.url_helpers.root_url
    host + SecureRandom.urlsafe_base64(4)
  end
end
