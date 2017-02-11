require 'singleton'
require 'yaml'
module Kl
  module Zipcode
    class Info
      include Singleton

      def zipcodes
        @@zipcodes ||= YAML::load_file(source)
      end

      def source
        path = File.join(File.dirname(__FILE__), '..', '..', '..','config', 'zipcodes.yml')
        File.expand_path(path)
      end

      def [](code)
        @@code = code
        Kl::Zipcode::Info.instance
      end

      alias_method :set_zipcode, :[]

      def to_hash
        value = zipcodes[@@code]
        raise NotFoundError, "Zipcode #{@@code} not found in #{source}" if value.nil?
        value
      end

      def county
        to_hash.fetch(:county)
      end
      def state
        to_hash.fetch(:state)
      end
      def city
        to_hash.fetch(:city)
      end
    end
  end
end
