# frozen_string_literal: true

##
# Abstract controller for application concerns.
#
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
