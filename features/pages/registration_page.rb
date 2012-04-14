require_relative 'mign_page'

class RegistrationPage < MignPage
  path '/users/sign_up'

  has_html_id :email,
              :first_name,
              :last_name,
              :password,
              :password_confirmation
  default_submit_button '#sign_up'
end