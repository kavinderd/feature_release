class FeatureRelease

  class Feature

  	attr_accessor :groups

    def initialize(name)
      @name = name
      @groups = []
    end  	

    def add_group(group)
      @groups << group.to_sym
    end

  end

end