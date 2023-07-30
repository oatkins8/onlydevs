module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      # filtering_params = {category: "music", genre: "Pop"}
      results = self.where(nil)
      # same as saying Event.all / SELECT * FROM events
      filtering_params.each do |key, value|
        results = results.public_send(key, value) if value.present?

        # public_send calls the scope method (e.g. category or genre) defined in the Event model
        # passing the value only if it is present

        # results = results.category("Music").genre("Pop")
        # the scopes are chained but not dependent on each other

      end

      results
    end
  end
end