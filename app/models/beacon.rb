class Beacon < ActiveRecord::Base
  has_many :forms
  belongs_to :employee


  def time_format
  	#need to make the time format better
  	self.updated_at.strftime('%l:%M%P')
  end

  def date_format
  	self.updated_at.strftime('%m/%e/%y')
  end

  def beacon_time_stamp
  	time_format + " " + 'on' + " " + date_format
  end
end
