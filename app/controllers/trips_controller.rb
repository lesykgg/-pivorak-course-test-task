class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    Trip.all.each do |t|
      if t.destinations.order(:datearr, :timearr).last.datearr < DateTime.now-1
        t.destroy
      end
    end
    @trips = Trip.all
    if params[:search] && params[:search2] && params[:search3]
      @trips = Trip.search(params[:search], params[:search2], params[:search3])
          .order('created_at DESC').uniq
    else
      @trips = Trip.all.order('created_at DESC')
    end
  end


  def show
  end

  def new
    if current_user.try(:admin?)
      @trip = Trip.new
    else
      respond_to do |format|
        format.html { redirect_to trips_url, notice: 'You have no permission to access this path.' }
      end
    end
  end

  def edit
    if current_user.try(:admin?)
      if @trip.tickets.any?
        respond_to do |format|
          format.html { redirect_to trips_url, notice: 'Cannot edit this trip: tickets was sold.' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to trips_url, notice: 'You have no permission to access this path.' }
      end

    end
  end

  def create
    # render json: params
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    @trip.destinations.destroy_all
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    if @trip.tickets.any?
      respond_to do |format|
        format.html { redirect_to trips_url, notice: 'Cannot destroy this trip: tickets was sold.' }
      end
    else
      @trip.destroy
      respond_to do |format|
        format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:timedep, :seats, destinations_attributes: [:trip_id, :point, :datearr,
                                                                             :timearr, :_destroy])
  end

end
