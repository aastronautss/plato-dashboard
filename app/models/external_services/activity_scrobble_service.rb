# frozen_string_literal: true

class ActivityScrobbleService < ExternalService
  APPS = { 'RescueTime' => 0 }.freeze

  enum app: APPS
end
