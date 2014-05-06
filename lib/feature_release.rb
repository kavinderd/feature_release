require "feature_release/version"

class FeatureRelease
  
  def initialize
  	@groups = {:all => lambda{|obj| true}}
  end

  def groups
  	@groups
  end
end
