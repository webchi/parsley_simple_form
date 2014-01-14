module I18nHelper

  def mock_i18n(hash)
    I18n.backend.store_translations(:en, hash)
  end

end