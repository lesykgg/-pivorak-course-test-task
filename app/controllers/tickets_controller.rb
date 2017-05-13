class TicketsController < ApplicationController

  def show
  end


  def new

    @trip = Trip.find(params[:trip_id])
    if current_user.tickets.find_by(trip_id: @trip).present?
      respond_to do |format|
        format.html { redirect_to trips_url, notice: 'You can`t buy more than one ticket on the same trip.' }
      end
    else
      @num = @trip.seats
      @seat = params[:seatnum].to_i
      @points = @trip.destinations.map(&:point)
      @ticket = Ticket.new
      @b = []
      @a = (0..@num).to_a
      @a.each do |d|
        @trip.tickets.each do |t|
          if t.seatnum == d
            @b.push(d)
          end
        end
      end
    end
  end

  def create
    @ticket = Ticket.new(tickets_params)
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to profile_url, notice: 'Ticket was successfully bought' }
        format.json { render :show, status: :created, location: ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def tickets_params
    params.require(:ticket).permit(:trip_id, :user_id, :seatnum, :name, :from, :to, :booked)
  end
end
