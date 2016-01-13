module IntegrationHelpers
  module Platform
    def self.windows?
      !!(RbConfig::CONFIG['target_os'] =~ /mingw/)
    end

    def self.osx?
      !!(RbConfig::CONFIG['target_os'] =~ /darwin/)
    end

    def self.linux?
      !!(RbConfig::CONFIG['target_os'] =~ /linux/)
    end
  end
end
