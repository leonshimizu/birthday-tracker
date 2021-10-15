class BirthdaysController < ApplicationController
  
  def index
    birthdays = Birthday.all
    render json: birthdays.as_json
  end
    
  def create
    new_birthday = Birthday.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      day: params[:day],
      month: params[:month],
      year: params[:year]
    )
    new_birthday.save
    render json: new_birthday.as_json
  end

end
