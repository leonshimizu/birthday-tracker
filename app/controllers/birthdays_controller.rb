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

  def show 
    first_name = params[:first_name]

    name = Birthday.where("lower(first_name) = ?", first_name.downcase).first
    
    render json: name.as_json
  end

  def age # make it more specific and make it find the exact age (days, months, and years)
    first_name = params[:first_name]

    name = Birthday.where("lower(first_name) = ?", first_name.downcase).first

    birthday_year = name["year"]
    current_year = Date.today.year

    age = current_year - birthday_year

    info = "#{first_name} is currently #{age} years old."

    render json: info.as_json
  end

  def update
    the_id = params[:id]
    birthday = Birthday.find_by(id: the_id)
    birthday.first_name = params[:first_name] || birthday.first_name
    birthday.last_name = params[:last_name] || birthday.last_name
    birthday.day = params[:day] || birthday.day
    birthday.month = params[:month] || birthday.month
    birthday.year = params[:year] || birthday.year
    birthday.save
    render json: birthday.as_json
  end

end
