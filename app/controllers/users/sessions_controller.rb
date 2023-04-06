# frozen_string_literal: true

module Users
  #
  # Override for Devise built-in Sessions controller.
  #
  class SessionsController < Devise::SessionsController
    private

    def after_sign_in_path_for(_resource_or_scope)
      admin_students_path
    end
  end
end
