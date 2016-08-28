# Your custom error classes will be placed here
class ProductNotFoundErrors

  class NotValidID < StandardError
    def initialize(message = 'Not A Valid ID!')
      super
    end
  end

end

