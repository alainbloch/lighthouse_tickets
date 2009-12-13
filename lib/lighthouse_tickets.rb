module LighthouseTickets # :nodoc:
  
  class LighthouseTicket
    require 'lighthouse'

    @@name = nil
    cattr_accessor :name

    @@revision = nil
    cattr_accessor :revision

    @@email = nil
    cattr_accessor :email

    @@category = nil
    cattr_accessor :category

    @@priority = nil
    cattr_accessor :priority

    @@title = nil
    cattr_accessor :title

    @@description = nil
    cattr_accessor :description

    @@location = nil
    cattr_accessor :location

    @@created_at = nil
    cattr_accessor :created_at  

    @@project = nil
    cattr_accessor :project

    @@account = nil
    cattr_accessor :account

    @@token = nil
    cattr_accessor :token

    @@site_name = nil
    cattr_accessor :site_name

    class << self
      
      def body
        <<-BODY
        There is a new ticket generated from the remote lighthouse ticket form.

        Submitter Name: #{name}

        Date Submitted: #{created_at.strftime("%m.%d.%Y, %I:%S %p")}

        Application Revision: #{revision}

        Location: #{location}

        Title:
        #{title}

        Description: 
        #{description}

        Priority: #{priority}

        Category: #{category}

        BODY
      end

      def create(attributes = {})
        set_attributes(attributes)
        Lighthouse.account = account
        Lighthouse.token   = token
        ticket = Lighthouse::Ticket.new(:project_id => project, 
                                        :title      => title, 
                                        :body       => body)
        ticket.tags << "WebTicket"
        ticket.tags << priority if PRIORITIES.values.include?(priority)
        ticket.tags << category if CATEGORIES.include?(category)
        ticket.tags << name
        ticket.tags << location
        ticket.tags << "Revision: #{revision}"
        if ticket.save
          return true
        else
          return false
        end
      end
    
      def set_attributes(attributes = {})
        self.name        = attributes[:name]
        self.email       = attributes[:email]
        self.category    = attributes[:category]
        self.priority    = attributes[:priority]
        self.title       = attributes[:title]
        self.location    = attributes[:location]
        self.description = attributes[:description]
        self.created_at  = Time.now
      end
      
    end
    
    PRIORITIES = {  "Critical" => "CRITICAL", 
                    "High"     => "HIGH", 
                    "Medium"   => "MEDIUM", 
                    "Low"      => "LOW", 
                    "N/A"      => "NA" }

    CATEGORIES = ["Bug", "Question", "Suggestion", "Comment", "Improvement"]

  end
  
end