require 'uri'

module Validation

  def valid_url?(url)
    uri = URI.parse(url)
    (uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def valid_float?(str)
    !!Float(str) rescue false
  end

  def valid_int?(str)
    !!Int(str) rescue false
  end

end