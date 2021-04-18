module EnumHelper
  
  def enum_display(klass, enum_attr, value = nil)
    if (!klass.is_a? Class)
      value = klass.send(enum_attr)
      klass = klass.class
    end
    klass.human_attribute_name([enum_attr, value].join('.'))
  end

    def enum_options_for_select(klass, enum)
      klass.send(enum.to_s.pluralize).map do |key, _|
      [enum_display(klass, enum, key), key]
    end

  end
end
