module VestalVersions
  # Ties into the existing ActiveRecord::Base#reload method to ensure that version information
  # is properly reset.
  module Reload
    extend ActiveSupport::Concern

    # Adds instance methods into ActiveRecord::Base to tap into the +reload+ method.
    module InstanceMethods
      # Overrides ActiveRecord::Base#reload, resetting the instance-variable-cached version numb
      # before performing the original +reload+ method.
      def reload(*args)
        reset_version
        super
      end
    end
  end
end
