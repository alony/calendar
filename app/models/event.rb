class Event < ActiveRecord::Base
  has_and_belongs_to_many :users
  named_scope :by_month, lambda{|date| {:conditions => {:event_dt => date.beginning_of_month..date.end_of_month}}}
  
  validates_presence_of :title, :event_dt
  
  def invite
    User.exclude(*self.users)
  end
  
  def users= invited
    self.users << invited if invited.any?
  end
  
end
