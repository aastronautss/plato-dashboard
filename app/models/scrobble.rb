# frozen_string_literal: true

##
# STI parent class for scrobbles.
#
class Scrobble < ApplicationRecord
  include IndifferentDataColumn

  validates :type, presence: true
  validates :scrobbled_at, presence: true
end
