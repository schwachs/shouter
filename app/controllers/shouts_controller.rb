class ShoutsController < ApplicationController
  
  before_filter :authorize
  
  def index 
    @shouts = Shout.top5 
    @shout = Shout.new
    
  end
  
  def new
    @shout = Shout.new
  end

  def create
    
 #   if current_user.shouts.create(params[:shout])
    
    @shout = Shout.new(params[:shout])
    @shout.user = current_user
    
    if @shout.save 
      flash[:success] = "Shout Created"
    else 
      flash[:failure] = "Shout not created"
    end
     
#    @shout.save 
   redirect_to shouts_path
   # :notice => "Shout Accepted"
  end
  
end
