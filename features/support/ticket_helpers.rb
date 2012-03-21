def get_ticket(subject)
  return @ticket if @ticket && @ticket.subject == subject
  tickets = Ticket.find(:all, "subject = '#{subject}'")
  return nil if tickets.length == 0
  raise "Found more than one ticket with subject #{subject}" if tickets.length > 1
  tickets[0]
end