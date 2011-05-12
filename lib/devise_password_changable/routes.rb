module ActionDispatch::Routing
  class Mapper

    protected

      def devise_password_change(mapping, controllers)
        resource :password_change, :only => [:show, :update], :path => mapping.path_names[:password_change], :controller => controllers[:change_passwords]
      end

  end
end