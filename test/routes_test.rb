require 'helper'

class RoutesTest < ActionController::TestCase

  test 'map edit password' do
    assert_recognizes({:controller => 'devise/password_change', :action => 'edit'}, {:path => 'merchants/password_change/edit', :method => :get})
  end

end