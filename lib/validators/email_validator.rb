class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if options[:allow_blank] && value.blank?

    unless value =~ /\A([\w-\.\+]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] <<
        (options[:message] || I18n.t("activerecord.errors.messages.not_an_email"))
    end
  end
end