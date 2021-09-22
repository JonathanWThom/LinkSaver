# frozen_string_literal: true

require "csv"

module Csvable
  extend ActiveSupport::Concern

  class_methods do
    def to_csv(*attributes)
      attributes = attributes.presence || column_names
      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |record|
          csv << attributes.map { |attr| record.send(attr) }
        end
      end
    end
  end
end
