
module ApplicationHelper

  def get_programs()
    user = ENV['altru_user']
    pass = ENV['altru_pass']
    link = "https://altrurig01bo3.blackbaudhosting.com/2532Altru_e4a2fe99-d6e1-46e7-a6c0-f6b932aa606d/ODataQuery.ashx?databasename=14AFCB42-1379-457A-AD0C-0CD6166E17F3&AdHocQueryID=b111720e-fa60-4074-8d36-560ffc8a1727"
    odata = open(link, http_basic_authentication: [user, pass]).read 
    json = JSON.parse odata 
    return json
  end

  def populate_from_file(json,location)
    var = ""
    programsfound = false
    runningshow = "something"
    
    json["value"].each do |json|
      if json['ItinerariesItemsProgramEventsLocationsName'] == location
        var += '<div class="row">'
          var += '<div class="col-sm-6">'
            if json['ItinerariesItemsProgramEventsStarttime'] != runningshow
              date = DateTime.strptime(json['ItinerariesItemsProgramEventsStarttime'],"%H%M")
              var += '<strong>' + date.strftime("%-I:%M") + " " + json['ItinerariesItemsProgramEventsName'] + '</strong>'
              runningshow = json['ItinerariesItemsProgramEventsStarttime']
            end
          var += '</div>'
          var += '<div class="col-sm-6">'
            var += json['ItinerariesName'] + " (" + json['SUMItinerariesAttendeesQuantity'].to_s + ")"
          var += "</div>"
        var += "</div>"
        programsfound = true
      end
    end

    if programsfound == false
      var += '<div class="alert alert-danger" role="alert">
          <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
          No groups are scheduled in Altru today in '+location+'.
        </div>'
    end
    return var.html_safe
  end

end

