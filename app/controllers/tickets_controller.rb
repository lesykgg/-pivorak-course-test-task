class TicketsController < ApplicationController
  #before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  
  def show
  end
  
  
  def new
    # trip = params[:trip_id].to_i
    @trip = Trip.find(params[:trip_id])
    @num = @trip.seats
    @seat = params[:seatnum].to_i
    @points = @trip.destinations.map(&:point)
    @ticket = Ticket.new
    # @ticket = trip.tickets.build(user: current_user)
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
  
  def create
    @ticket = Ticket.new(tickets_params)
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully bought' }
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
