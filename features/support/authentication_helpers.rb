def login_with(credentials)
  visit new_user_session_path if current_path != new_user_session_path
  fill_in       'user_email',    :with => credentials[:email]
  fill_in       'user_password', :with => credentials[:password]
  click_button  'login'
end