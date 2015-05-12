Rails.application.routes.draw do
  namespace :api, defaults: {format: :json}, constraints: {subdomain: 'api'}, path: '/' do
    #this will nest the api under api.examplewebsite.com/
    #worry about versioning later
    scope module: :vi do
      #developer shouldn't have to worry about version in URL.
      #they should automatically use latest version
      # to do this we have to change version access thru HTTP Headers

      #also check out rocketpants and versionist gem to handle versioning configuration
    end

  end

end
