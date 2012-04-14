require_relative 'mign_page'

class WorkspacesPage < MignPage
  path '/workspaces'

  has_html_element_id 'logout'
end