require_relative 'zipcode/version'
require_relative 'zipcode/exceptions'
require_relative 'zipcode/info'
module Kl
  module Zipcode
    def [](code)
      Info.instance.set_zipcode(code)
    end
    module_function :[]
  end
end
