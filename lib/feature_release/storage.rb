require 'spec_helper'
class FeatureRelease
  class Storage

 	def initialize(options={})
 	  @store = options.fetch(:store)
 	end

 	def save(feature)
 	  persist(feature)
 	end

 	def get(feature)
 	  retrieve(feature_key(feature))
 	end

 	def get_all
 	  (retrieve(global_key) || "").split(",")
 	end


 	private

 	  def feature_key(feature)
 	  	"feature:#{feature.name}"
 	  end

 	  def global_key
 	  	"features:all"
 	  end

 	  def persist(feature)
 	  	@store.set("feature:#{feature.name}", feature.serialized)
 	  	@store.set("features:all", (get_all | [feature.name]).join(","))
 	  end

 	  def retrieve(key)
 	  	@store.get(key)
 	  end

  end
end