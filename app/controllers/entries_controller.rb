class EntriesController < ApplicationController
  

  def show
    @entry = Entry.find_by({"id" => params["id"]})
    @place = Place.find_by({"id" => @entry["place_id"]})
    # render entries/show view with details about Contact
  end

  def new
   @entry = Entry.new
    @place = Place.find_by({ "id" => params["place_id"] })
    # render contacts/new view with new Contact form
  end

  def create
    # start with a new Contact
    @entry = Entry.new

    # assign user-entered form data to Contact's columns
    @entry["title"] = params["title"]
    @entry["posted_on"] = params["posted_on"]
    @entry["description"] = params["description"]

    # assign relationship between entry and place
    @entry["place_id"] = params["place_id"]

    # save entry row
    @entry.save

    # redirect user
    redirect_to "/places/#{@entry["place_id"]}"
  end

  def destroy
    @entry = Entry.find_by({ "id" => params["id"] })

    @entry.destroy

    redirect_to "/places/#{@entry["place_id"]}"
  end

end