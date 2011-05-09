require 'active_support/core_ext/integer'
require 'active_support/ordered_hash'
require 'active_support/concern'
require 'devise'

module DevisePasswordChangable
  # module Controllers
  #     autoload :Helpers, 'devise_password_changable/controllers/helpers'
  #   end
end

require 'devise_password_changable/routes'

Devise.add_module :password_changable, :controller => :change_passwords, :model => 'devise_password_changable/models/password_changable', :route => :password_change
