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

  def show # check to see if there's a way to check for a name in the db that isn't case sensitive
    name = params[:first_name]
    birthday = Birthday.find_by(first_name: name)
    render json: birthday.as_json
  end

end
