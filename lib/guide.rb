require "guide/engine"

module Guide
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :company_name, :controller_class_to_inherit

    def initialize
      @company_name = 'Your awesome company'
      @controller_class_to_inherit = 'ActionContoller::Base'
    end
  end
end
