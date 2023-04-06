# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  scope :ordered, ->  (column: :created_at, sort: :desc){ order(column => sort) }
end
