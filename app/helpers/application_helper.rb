module ApplicationHelper
  def populate_programs(location)
    file = open('http://signs.adventuresci.org/data/rooms.xml').read
    file.gsub! '<d:', '<'
    file.gsub! '<m:', '<'
    xml = Nokogiri::XML(file)
    var = ""
    programsfound = false
    runningshow = "something"
    xml.css('entry').each do |node|
      if node.at('ItinerariesItemsProgramEventsLocationsName').text == location
        var += '<div class="row">'
          var += '<div class="col-sm-6">'
            if node.at('ItinerariesItemsProgramEventsStarttime').text != runningshow
              date = DateTime.strptime(node.at('ItinerariesItemsProgramEventsStarttime').text,"%H%M")
              var += '<strong>' + date.strftime("%-I:%M") + " " + node.at('ItinerariesItemsProgramEventsName').text + '</strong>'
              runningshow = node.at('ItinerariesItemsProgramEventsStarttime').text
            end
          var += '</div>'
          var += '<div class="col-sm-6">'
            var += node.at('ItinerariesName').text + " (" + node.at('SUMItinerariesAttendeesQuantity').text + ")"
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

