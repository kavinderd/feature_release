require 'spec_helper'
class FeatureRelease
  class Storage

 	def initialize(options={})
 	  @store = options.fetch(:store)
 	end

 	def save(feature)
 	  persist(feature)
 	end


 	private

 	  def persist(feature)
 	  	@store.set("feature:#{feature.name}", feature.serialized)
 	  end

  end
end