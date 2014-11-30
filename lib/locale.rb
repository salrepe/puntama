module Locale
  def self.included(base)
    base.class_eval do
      configure do
        I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
        I18n.load_path = Dir[File.join(Puntama.root, 'config', 'locales', '*.yml')]
        I18n.backend.load_translations
        I18n.default_locale = :en
      end

      before do
        I18n.locale = params['locale'] || session[:locale]
        session[:locale] = I18n.locale
      end
    end
  end
end
