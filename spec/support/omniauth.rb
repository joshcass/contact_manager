def login_as(user)
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = { "provider" => user.provider,
                                          "uid" => user.uid,
                                          "info" => {"name" => user.name, "image" => user.image }
                                         }
  visit(login_path)
end
