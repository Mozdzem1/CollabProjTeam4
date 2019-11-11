class DashboardsController < ApplicationController

   #@user.user_img.attach(params[:user_img])

 def new
 end

=begin
 def img
     if !@user.img.attached? 
        @user.img.attach(params[:img])
    end
 end
=end

 def edit
 end
 
 def update
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
