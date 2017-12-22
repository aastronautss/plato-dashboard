# frozen_string_literal: true

##
# Parent class for external service data.
#
class ExternalService < ApplicationRecord
  validates :type, presence: true
  validates :name, presence: true

  def data
    read_attribute(:data)&.with_indifferent_access
  end

  def adapter
    klass = Object.const_get(name)
    klass.new(self)
  end
end
