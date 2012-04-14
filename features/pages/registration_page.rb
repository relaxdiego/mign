require_relative 'mign_page'

class RegistrationPage < MignPage
  path '/users/sign_up'
  default_submit_button :sign_up

  has_html_element_id :email
  has_html_element_id :first_name
  has_html_element_id :last_name
  has_html_element_id :password
  has_html_element_id :password_confirmation
end