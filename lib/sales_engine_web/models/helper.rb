module SalesEngineWeb
  module Helper

    def has_many(things)
      define_method things do
        things_class = SalesEngineWeb.const_get(things.to_s[0..-2].capitalize)
        methodname="find_all_by_#{self.class.to_s.split('::').last.downcase}_id"
        things_class.send(methodname, id)
      end
    end

    def create(params)
       self.new(params).save
    end

    def add(subject)
      table.insert(subject.to_hash)
    end

    def random
      result = table.to_a.sample
      self.new(result) if result
    end

    def find(id)
      result = table.where(:id => id.to_i).first
      new(result) if result
    end
  end
end
