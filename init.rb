require 'lighthouse_tickets'

ActionController::Base.send :include, LighthouseTickets
ActionView::Base.send :include, LighthouseTicketsHelper

