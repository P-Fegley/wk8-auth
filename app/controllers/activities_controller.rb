class ActivitiesController < ApplicationController

  def create
    if session["user_id"].present?  # restricts the form to a logged-in user
      @activity = Activity.new
      @activity["contact_id"] = params["contact_id"]
      @activity["activity_type"] = params["activity_type"]
      @activity["user_id"] = session["user_id"]  # tags the logged-in user to the activity
      @activity["note"] = params["note"]
      @activity.save
    end
    redirect_to "/contacts/#{@activity["contact_id"]}"
  end

end
