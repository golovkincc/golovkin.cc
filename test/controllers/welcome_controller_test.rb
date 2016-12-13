require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  include HttpAcceptLanguage

  test 'should set locale from HTTP_ACCEPT_LANGUAGE for first come in' do
    get root_url
    assert_equal :ru, I18n.locale
  end

  test 'should set locale=en if HTTP_ACCEPT_LANGUAGE=nil for first come in' do
    I18n.available_locales = []
    get root_url
    assert_equal 'en', I18n.locale
  end

  test 'should take local from params for second come in' do
    cookies[:locale] = :ru
    get root_en_url
    assert_equal @request.params[:locale].to_s, 'en'
  end
end
