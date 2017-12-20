# frozen_string_literal: true

class ExternalService < ApplicationRecord
  validates :type, presence: true
  validates :name, presence: true
end
