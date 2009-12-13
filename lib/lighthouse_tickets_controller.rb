class LighthouseTicketsController < ApplicationController
  
  def create
    respond_to do |format|
      if LighthouseTickets::LighthouseTicket.create(params[:ticket])
        flash[:notice]="Your ticket was successfully posted, we will try to fix it."
        format.js do
          render :update do |page|
            page << "LighthouseTicket.toggle('hide');"
            page << "alert('#{flash[:notice]}');"
            flash[:notice] = nil
          end
        end
        format.html { redirect_to :back }
      else
        flash[:error] = 'An error occurred and your ticket has not been created.'
        format.js do
          render :update do |page|
            page << "alert(#{flash[:error]});"
          end
        end
        format.html { redirect_to :back }
      end
    end
  end
  
end