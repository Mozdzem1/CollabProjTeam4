class DashboardsController < ApplicationController

 def new

 end
 

 def edit
      @user = User.find(params[:id])
 end
 
 def update
     @user = User.find(params[:id])
     @user.update(name: params[:user][:name], address: params[:user][:address])
     redirect_to :dashboard_path
 end


def index
    if current_user.org?
      @organizations = Organization.where('email = ?', user_email)
      @organizations = @organizations.sort_by &:name
    
      @opportunities = Opportunity.where('email = ?', user_email)
      @opportunities = @opportunities.sort_by &:on_date
    elsif false # TODO ADMIN
      @organizations = Organization.all.sort_by &:name
    
      @opportunities = Opportunity.all.sort_by &:on_date
    else # normal user
      @organizations = Organization.where(approved: true).sort_by(&:name)
      @opportunities = Opportunity.all
      @favorites = current_user.favorited_opportunities
      @favorites = @favorites.sort_by(&:created_at).reverse
    end
end

end
