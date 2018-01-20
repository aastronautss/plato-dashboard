# frozen_string_literal: true

##
# Parent class for external service data.
#
class ExternalService < ApplicationRecord
  include IndifferentDataColumn

  validates :type, presence: true
  validates :app, presence: true

  def adapter
    @adapter ||= _adapter
  end

  private

  def _adapter
    klass = Object.const_get(app)
    klass.new(self)
  end
end
