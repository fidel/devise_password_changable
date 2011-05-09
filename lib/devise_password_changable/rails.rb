module DevisePasswordChangable
  class Engine < ::Rails::Engine # :nodoc:
    ActiveSupport.on_load(:action_controller) do
      include DevisePasswordChangable::Controllers::Helpers
    end
  end
end
