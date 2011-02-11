class User < ActiveRecord::Base
  has_and_belongs_to_many :events
  named_scope :exclude, lambda{|*users| {:conditions => ["id NOT IN (?)", users.map(&:id)]}}
  
  acts_as_authentic
  
  before_destroy do |record|
    record.events.each do |event|
      event.destroy if event.users.count==1
    end
  end
  
  def full_name
    name ? "#{name} (#{email})" : e_mail
  end
  
end
