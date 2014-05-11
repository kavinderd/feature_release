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

    def remove_group(group)
      @groups.delete(group.to_sym)
    end

    def serialized
      @groups.join(",")
    end

  end

end