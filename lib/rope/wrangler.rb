module Rope
  class Wrangler < Sinatra::Base
    get '/test' do 
      "Hello #{User.first.name}! from Wrangler"
    end
  end
end
