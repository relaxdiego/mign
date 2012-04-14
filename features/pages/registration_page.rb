require_relative 'mign_page'

class RegistrationPage < MignPage
  path '/users/sign_up'

  default_submit_button '#sign_up'

  expects_selectors '#email',
                    '#first_name',
                    '#last_name',
                    '#password',
                    '#password_confirmation'
end