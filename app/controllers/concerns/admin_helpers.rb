# frozen_string_literal: true

# Helpers included in the Admin::Application controller
#
module AdminHelpers
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
  end
end
