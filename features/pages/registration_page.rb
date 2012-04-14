require_relative 'mign_page'

class RegistrationPage < MignPage
  path '/users/sign_up'
  default_submit_button 'login'
end