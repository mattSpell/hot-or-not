module Features
  module AuthenticationHelpers

    def signin_as(user_type, options = {})
      Fabricate(:user)
      user = (user_type.is_a? Symbol) ? Fabricate(user_type, options) : user_type
      sign_into_facebook_as(user)
      visit user_omniauth_authorize_path("facebook")
      user
    end

    def sign_into_facebook_as(user_or_username, token: nil)
      if user_or_username.is_a? User
        user = user_or_username
      end

      token = user_or_username.try(:facebook_access_token) || token || ENV["FACEBOOK_ACCESS_TOKEN"]
      username = user_or_username.try(:facebook_username) || user_or_username
      uid = user_or_username.try(:facebook_uid) || '12345'
      email = user.try(:email) || "#{username}smith@example.com"

      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(:facebook, {
        uid: uid,
        credentials: {
          token: token
        },
        info: {
          nickname: username,
          email: email,
          name: "#{username.capitalize} Smith",
        }
      })
    end
  end
end

RSpec.configure do |config|
  config.include Features::AuthenticationHelpers, type: :feature
end
