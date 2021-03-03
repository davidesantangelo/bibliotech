require 'pagy/extras/headers'
require 'pagy/extras/array'

class BaseController < ApplicationController
  include Response
  include ExceptionHandler
  include Serializer
  include Pagy::Backend
  include ::ActionController::Cookies

  Pagy::VARS[:headers] = { page: 'Current-Page', items: 'Per-Page', pages: false, count: 'Total' }

  def render(*args, &block)
    pagy_headers_merge(@pagy) if @pagy
    super
  end
end
