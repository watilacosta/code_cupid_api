# frozen_string_literal: true

module Auth
  class UpdateConfirmationCode
    include Interactor

    def call
      unless context.code.present?
        raise ActiveModel::MissingAttributeError, I18n.t('activerecord.errors.messages.invalid_code')
      end

      context.users.first.update_attribute(:confirmation_code, context.code)
    rescue ActiveModel::MissingAttributeError => e
      context.fail!(error: e.message)
    end
  end
end
