require 'spec_helper'
class FeatureRelease
  class Storage

 	def initialize(options={})
 	  @store = options.fetch(:store)
 	end

  end
end