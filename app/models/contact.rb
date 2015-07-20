class Contact < ActiveRecord::Base

validates_presence_of :phone
validates_presence_of :name

end
