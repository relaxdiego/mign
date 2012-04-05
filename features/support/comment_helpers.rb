def get_comment(subject)
  return @comment if @comment && @comment.subject == subject
  comments = Comment.find(:all, "subject = '#{subject}'")
  return nil if comments.length == 0
  raise "Found more than one ticket with subject #{subject}" if comments.length > 1
  comments[0]
end