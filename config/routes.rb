Rails.application.routes.draw do
  mount SabisuRails::Engine => "/sabisu_rails"
  devise_for :users
  namespace :api, defaults: {format: :json}, constraints: {subdomain: 'api'}, path: '/' do
    #this will nest the api under api.examplewebsite.com/
    #worry about versioning later
    scope module: :v1 do
      #developer shouldn't have to worry about version in URL.
      #they should automatically use latest version
      # to do this we have to change version access thru HTTP Headers

      #also check out rocketpants and versionist gem to handle versioning configuration
      resources :users
    end

  end

end

=begin 2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  4. If you are deploying on Heroku with Rails 3.2 only, you may want to set:

       config.assets.initialize_on_precompile = false

     On config/application.rb forcing your application to not access the DB
     or load models when precompiling your assets.

  5. You can copy Devise views (for customization) to your app by running:

       rails g devise:views
=end
