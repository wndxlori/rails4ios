class FieldTripsController < ApplicationController
  # GET /field_trips
  # GET /field_trips.xml
  def index
    @field_trips = FieldTrip.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @field_trips }
    end
  end

  # GET /field_trips/1
  # GET /field_trips/1.xml
  def show
    @field_trip = FieldTrip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @field_trip }
    end
  end

  # GET /field_trips/new
  # GET /field_trips/new.xml
  def new
    @field_trip = FieldTrip.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @field_trip }
    end
  end

  # GET /field_trips/1/edit
  def edit
    @field_trip = FieldTrip.find(params[:id])
  end

  # POST /field_trips
  # POST /field_trips.xml
  def create
    @field_trip = FieldTrip.new(params[:field_trip])

    respond_to do |format|
      if @field_trip.save
        format.html { redirect_to(@field_trip, :notice => 'Field trip was successfully created.') }
        format.xml  { render :xml => @field_trip, :status => :created, :location => @field_trip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @field_trip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /field_trips/1
  # PUT /field_trips/1.xml
  def update
    @field_trip = FieldTrip.find(params[:id])

    respond_to do |format|
      if @field_trip.update_attributes(params[:field_trip])
        format.html { redirect_to(@field_trip, :notice => 'Field trip was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @field_trip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /field_trips/1
  # DELETE /field_trips/1.xml
  def destroy
    @field_trip = FieldTrip.find(params[:id])
    @field_trip.destroy

    respond_to do |format|
      format.html { redirect_to(field_trips_url) }
      format.xml  { head :ok }
    end
  end
  
  # List registrations for the field trip
  def registrations
    @field_trip = FieldTrip.find(params[:id])
    @students = @field_trip.students
    respond_to do |format|
      format.html # registrations.html.erb
      format.csv {
        send_data @students.to_comma,
          :type => "text/plain",
          :filename => "#{@field_trip.name}-studentlist.csv",
          :disposition => 'attachment'        
      }
#      format.csv { render :csv => @students.to_comma }
    end
  end
end
