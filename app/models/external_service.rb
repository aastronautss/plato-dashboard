# frozen_string_literal: true

##
# Parent class for external service data.
#
class ExternalService < ApplicationRecord
  include IndifferentDataColumn

  validates :type, presence: true

  def adapter
    @adapter ||= _adapter
  end

  private

  def _adapter
    self.class.const_get('ADAPTER').new(self)
  end
end
