require_relative 'mign_page'

class WorkspacesPage < MignPage
  path '/workspaces'

  expects_selector '#logout'
end