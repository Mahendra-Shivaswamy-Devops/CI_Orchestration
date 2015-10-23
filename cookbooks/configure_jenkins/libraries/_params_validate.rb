if Gem::Requirement.new('< 12.0').satisfied_by?(Gem::Version.new(Chef::VERSION))
  require 'chef/mixin/params_validate'
  class Chef
    module Mixin::ParamsValidate
      def set_or_return(symbol, arg, validation)
        iv_symbol = "@#{symbol}".to_sym
        if arg.nil? && self.instance_variable_defined?(iv_symbol) == true
          ivar = instance_variable_get(iv_symbol)
          if ivar.is_a?(DelayedEvaluator)
            validate({ symbol => ivar.call }, { symbol => validation })[symbol] # rubocop:disable BracesAroundHashParameters
          else
            ivar
          end
        else
          if arg.is_a?(DelayedEvaluator)
            val = arg
          else
            val = validate({ symbol => arg }, { symbol => validation })[symbol] # rubocop:disable BracesAroundHashParameters

            # Handle the case where the "default" was a DelayedEvaluator
            val = val.call(self) if val.is_a?(DelayedEvaluator) # rubocop:disable BlockNesting
          end
          instance_variable_set(iv_symbol, val)
        end
      end
    end
  end

  require 'chef/resource/lwrp_base'
  class Chef
    class Resource::LWRPBase
      def self.lazy(&block)
        DelayedEvaluator.new(&block)
      end
    end
  end
end
