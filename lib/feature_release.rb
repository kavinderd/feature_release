require "feature_release/version"

class FeatureRelease

  attr_reader :groups
  
  def initialize
  	@groups = {:all => lambda{|obj| true}}
  end

end
