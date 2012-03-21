def get_workspace(name)
  return @workspace if @workspace.name == name
  workspace = Workspace.find_by_name(name)
  raise "Couldn't find a workspace with name #{name}" if workspace.nil?
  workspace
end