require_relative "./project_factory"

Factory.define :ticket do |ticket|
  ticket.title "Ticket"
  ticket.description "This is a factory ticket."
  ticket.project { |p| p.association(:project) }
  ticket.user { |u| u.association(:user) }
end
