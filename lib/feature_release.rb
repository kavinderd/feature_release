require "feature_release/version"

class FeatureRelease
  
  def initialize
  	@groups = {:all => {|obj| true}}
  end
end
