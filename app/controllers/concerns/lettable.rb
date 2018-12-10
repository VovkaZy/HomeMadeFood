# frozen_string_literal: true

module Lettable
  def let(name, &blk)
    iv = "@#{name}"

    define_method name do
      return instance_variable_get iv if instance_variable_defined? iv

      instance_variable_set iv, instance_eval(&blk)
    end
    helper_method name

    define_method :"#{name}=" do |value|
      instance_variable_set iv, value
    end
    private :"#{name}="
  end
end
