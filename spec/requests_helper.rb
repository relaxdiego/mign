def sign_in(user)
  visit new_user_session_path
  fill_in       'user_email',    :with => @user_1.email
  fill_in       'user_password', :with => @user_1.password
  click_button  'Sign in'
end
