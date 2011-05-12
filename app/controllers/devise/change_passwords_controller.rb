class Devise::ChangePasswordsController < ApplicationController

  respond_to :html

  prepend_before_filter :authenticate_scope!, :only => [:show, :update]
  include Devise::Controllers::InternalHelpers

  def show
    render_with_scope :show
  end

  def update

    if resource.update_with_password(params[resource_name])
      set_flash_message :notice, :updated
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      render_with_scope :show
    end
  end

  protected

    def after_update_path_for(resource)
      if defined?(super)
        ActiveSupport::Deprecation.warn "Defining after_update_path_for in ApplicationController " <<
          "is deprecated. Please add a ChangePasswordsController to your application and define it there."
        super
      else
        after_sign_in_path_for(resource)
      end
    end

    def authenticate_scope!
      send(:"authenticate_#{resource_name}!")
      self.resource = send(:"current_#{resource_name}")
    end

end