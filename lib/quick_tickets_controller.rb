class QuickTicketsController < ActionController::Base
  
  def index
    redirect_back_or_default("/")
  end
  
  def new
    redirect_back_or_default("/")
  end
  
  def create 
    redirect_back_or_default("/") and return unless IterativeDesigns::QuickTicket.enabled?
    
    if not params[:body].blank? and not params[:title].blank?
      body = params[:body]
      body += "\n\nCreated from the web by #{params[:user]} #{params[:email}}"
      body += "\nURL: #{params[:url]}"
      redirect_url = "/"
      redirect_url = params[:url] unless params[:url] == "/create_ticket"
      Lighthouse.account = IterativeDesigns::QuickTicket.account
      Lighthouse.token   = IterativeDesigns::QuickTicket.token
      ticket = Lighthouse::Ticket.new(:project_id => IterativeDesigns::QuickTicket.project, :title=>params[:title], :body=>body)
      ticket.tags << "WebTicket"
      ticket.tags << params[:priority] if ["CRITICAL", "HIGH", "MEDIUM", "LOW", "NA"].include?(params[:priority])
      url = params[:url]
      controller = url.slice(1..((url.index("/", 1) || 0) - 1))
      ticket.tags << controller unless controller.blank?
      ticket.tags << "#{params[:user]}"
      ticket.tags << RAILS_ENV
      if ticket.save
        flash[:notice]="Your ticket was successfully posted, we will try to fix it."
      else
        puts ticket.errors
      end
    end 
    respond_to do |format|
      format.html { redirect_to(redirect_url) }
      format.js  { 
        render :update do |page| 
          page << "QuickTicket.toggle('hide');"
          page << "QuickTicket.notify('#{flash[:notice]}')"
          flash[:notice] = nil
        end
      }
    end
  end
  
  
  def edit
    redirect_back_or_default("/")
  end
  
  def update
    redirect_back_or_default("/")
  end
  
  def delete
    redirect_back_or_default("/")
  end
  
end
