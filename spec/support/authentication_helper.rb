module Features
  module AuthenticationHelpers

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

    def sign_into_twitter_as(user_or_username, token: nil)
      if user_or_username.is_a? User
        user = user_or_username
      end

      token = user_or_username.try(:twitter_access_token) || token || ENV["TWITTER_ACCESS_TOKEN"]
      username = user_or_username.try(:twitter_username) || user_or_username
      uid = user_or_username.try(:twitter_uid) || '12345'
      email = user.try(:email) || "#{username}smith@example.com"

      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(:twitter, {
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
