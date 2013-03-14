module SalesEngineWeb
  module Helper

    def has_many(things)
      define_method things do
        things_class = SalesEngineWeb.const_get(things.to_s[0..-2].capitalize)
        method_name = "find_all_by_#{self.class.to_s.split('::').last.downcase}_id"
        things_class.send(method_name, id)
      end
    end

    def has_one(thing)
      define_method thing do
        thing_class = SalesEngineWeb.const_get(thing.to_s[0..-1].capitalize)
        method_name = "find_by_#{self.to_s.split('::').last.downcase}_id"
        thing_class.send(method_name, id)
      end
    end

    def create(params)
       self.new(params).save
    end
  end
end
