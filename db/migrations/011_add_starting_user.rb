require "pathological"

require_relative "../../models/user"

Sequel.migration do
  up do
    user = User.new(:email => "deleteme@botprovoking.org", :first_name => "Delete", :last_name => "Me",
                    :permission => "admin", :enabled => 1)
    user.set_password("how_provocative")
    user.save
  end

  down do
    User[:email => "deleteme@botprovoking.org"].delete rescue nil
  end
end
