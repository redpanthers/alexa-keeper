class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    uri = URI.parse(value)
    record.errors.add(attribute, 'is invalid') unless valid_url?(uri)
  end

  private

  def valid_url?(uri)
    uri && valid_host?(uri.host)
  rescue URI::InvalidURIError
    false
  end

  def valid_host? host
    host.present? && valid_characters?(host)
  end

  def valid_characters? host
    !host[/[\s\!\\"$%&'\(\)*+_,:;<=>?@\[\]^|£§°ç\/]/] && host.include?('.')
  end

end

