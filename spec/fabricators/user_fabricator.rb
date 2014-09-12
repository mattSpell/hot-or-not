Fabricator(:user) do
  uid { sequence(:uid, 12345).to_s }
  name { "Bob Smith" }
  email{ "bob@bob.com" }
  password{ "password1" }

end
