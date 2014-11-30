module Puntama
  class << self
    def root
      ENV['RACK_ROOT'] || File.expand_path(File.dirname(__FILE__) + '/../')
    end

    def env
      ENV['RACK_ENV'] || 'development'
    end

    def views_path
      File.join(root, 'app/views')
    end
  end
end
