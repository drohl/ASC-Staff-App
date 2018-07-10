class PagesController < ApplicationController
  before_action :logged_in_user, except: [ :home, :groups  ]

  def home
  end
  def ticketsales
  end
  def allplanetarium
  end
  def groupprograms
  end
  def groups
  end
  def dss
  end
  def eclipse
  end
  def sleepovers
  end
  def labs
  end
  def grouptotals
  end
  def itinerarylong
  end
  def itinerary
  end
  def users
  end
  def latelog
  end
  def pltmsched
  end
end
