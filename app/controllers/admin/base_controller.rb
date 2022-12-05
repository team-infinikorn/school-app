# frozen_string_literal: true

module Admin
  #
  # Base controller for all admin controllers
  #
  class BaseController < ApplicationController
    include AdminHelpers
  end
end
