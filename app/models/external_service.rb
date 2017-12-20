# frozen_string_literal: true

##
# Parent class for external service data.
#
class ExternalService < ApplicationRecord
  validates :type, presence: true
  validates :name, presence: true
end
