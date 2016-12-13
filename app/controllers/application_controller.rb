class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  private

  def set_locale
    if cookies_locale.blank?
      self.cookies_locale = http_language
      redirect unless locale_language?
    else
      self.cookies_locale = locale_language
    end
  end

  def redirect
    if default_locale?
      redirect_to default_locale_path, status: '301'
    else
      redirect_to foreign_locale_path, status: '301'
    end
  end

  def default_locale?
    cookies_locale == I18n.default_locale.to_s
  end

  def locale_language?
    cookies_locale == locale_language
  end

  def cookies_locale
    cookies[:locale]
  end

  def cookies_locale=(value)
    cookies[:locale] = value
  end

  def http_language
    http_accept_language.compatible_language_from(I18n.available_locales).to_s || 'en'
  end

  def locale_language
    params[:locale].to_s
  end

  def default_locale_path
    request.path.sub(%r(\A/#{locale_language}), '')
  end

  def foreign_locale_path
    "/#{cookies_locale}#{request.path}"
  end
end
