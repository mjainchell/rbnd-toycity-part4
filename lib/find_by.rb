class Module

    def method_missing(name_of_method, *arguments)
      if(search_for = %r{(find_by_)(\w+)}.match(name_of_method.to_s))
        create_finder_methods(search_for[2])
        send(name_of_method, *arguments)
      else
        super
      end
    end

    def respond_to_missing?(name_of_method, include_private = false)
      if(search_for = %r{(find_by_)(\w+)}.match(name_of_method.to_s))
        self.new.respond_to?(search_for[2])
      else
        super
      end
    end

    def create_finder_methods(*attributes)
      attributes.each do |attribute|
        self.instance_eval(
          "def find_by_#{attribute.to_s}(argument)
              self.all.each do |item|
                if item.#{attribute.to_s} == argument
                  return item
                end
              end
          end"
        )
      end
    end

end