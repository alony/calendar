class EventsController < ApplicationController
  before_filter :find_event, :only => [:edit, :update, :show, :destroy]
  before_filter :validate_current_user
  
  def index
    @date = Date.parse(params[:date]) rescue nil
    @date ||= Date.today
    @events = Event.by_month(@date)
    respond_to do |format|
      format.js {render :layout => false}
      format.html
    end
  end
  
  def new
    @event = Event.new
    @event.event_dt = (params[:dt] ? Date.parse(params[:dt]).next : nil) rescue nil
    @event.users << current_user
    respond_to do |format|
      format.js {render :layout => false}
      format.html
    end
  end
  
  def create
    @event = Event.new params[:event]
    @event.users << current_user
    respond_to do |format|
      if @event.save
        format.js {render :layout => false}
        format.html
      else
        render :action => 'new'
      end
    end
  end
  
  def edit
    respond_to do |format|
      format.js {render :layout => false}
      format.html
    end
  end
  
  def update
    @prev_date = @event.event_dt
    respond_to do |format|
      if @event.update_attributes params[:event]
        format.js {render :layout => false}
        format.html {redirect_to @event}
      else
        render :action => :edit
      end 
    end
  end
  
  def destroy
    @event.destroy
    redirect_to root_path
  end
  
  private 
  def validate_current_user
    render :action => :index and return false unless current_user
  end
  
  def find_event
    @event = Event.find_by_id params[:id]
    redirect_to root_path if @event.blank?
  end
end
