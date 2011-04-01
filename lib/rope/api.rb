require "grape"

class Rope::API < Grape::API
  version '1'

  helpers do
    def current_user
    end
  end

  resource :statuses do
    get :all_users do
      User.all
    end
  end

end
