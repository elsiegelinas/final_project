class RestaurantsController < ApplicationController
  def index
    @q = Restaurant.ransack(params[:q])
    @restaurants = @q.result(:distinct => true).includes(:user_reviews, :restaurant_tags, :neighborhood, :cuisine, :users, :tags).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@restaurants.where.not(:address_latitude => nil)) do |restaurant, marker|
      marker.lat restaurant.address_latitude
      marker.lng restaurant.address_longitude
      marker.infowindow "<h5><a href='/restaurants/#{restaurant.id}'>#{restaurant.name}</a></h5><small>#{restaurant.address_formatted_address}</small>"
    end

    render("restaurants/index.html.erb")
  end

  def show
    @tagging = Tagging.new
    @user_review = UserReview.new
    @restaurant = Restaurant.find(params[:id])

    render("restaurants/show.html.erb")
  end

  def new
    @restaurant = Restaurant.new

    render("restaurants/new.html.erb")
  end

  def create
    @restaurant = Restaurant.new

    @restaurant.name = params[:name]
    @restaurant.description = params[:description]
    @restaurant.address = params[:address]
    @restaurant.forecast_rating = params[:forecast_rating]
    @restaurant.number_of_reviews = params[:number_of_reviews]
    @restaurant.google_rating = params[:google_rating]
    @restaurant.opentable_rating = params[:opentable_rating]
    @restaurant.infatuation_rating = params[:infatuation_rating]
    @restaurant.tripadvisor_rating = params[:tripadvisor_rating]
    @restaurant.yelp_rating = params[:yelp_rating]
    @restaurant.eater_list = params[:eater_list]
    @restaurant.infatuation_list = params[:infatuation_list]
    @restaurant.other_top_list = params[:other_top_list]
    @restaurant.neighborhood_id = params[:neighborhood_id]
    @restaurant.price = params[:price]
    @restaurant.cuisine_id = params[:cuisine_id]
    @restaurant.hours = params[:hours]

    save_status = @restaurant.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/restaurants/new", "/create_restaurant"
        redirect_to("/restaurants")
      else
        redirect_back(:fallback_location => "/", :notice => "Restaurant created successfully.")
      end
    else
      render("restaurants/new.html.erb")
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])

    render("restaurants/edit.html.erb")
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    @restaurant.name = params[:name]
    @restaurant.description = params[:description]
    @restaurant.address = params[:address]
    @restaurant.forecast_rating = params[:forecast_rating]
    @restaurant.number_of_reviews = params[:number_of_reviews]
    @restaurant.google_rating = params[:google_rating]
    @restaurant.opentable_rating = params[:opentable_rating]
    @restaurant.infatuation_rating = params[:infatuation_rating]
    @restaurant.tripadvisor_rating = params[:tripadvisor_rating]
    @restaurant.yelp_rating = params[:yelp_rating]
    @restaurant.eater_list = params[:eater_list]
    @restaurant.infatuation_list = params[:infatuation_list]
    @restaurant.other_top_list = params[:other_top_list]
    @restaurant.neighborhood_id = params[:neighborhood_id]
    @restaurant.price = params[:price]
    @restaurant.cuisine_id = params[:cuisine_id]
    @restaurant.hours = params[:hours]

    save_status = @restaurant.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/restaurants/#{@restaurant.id}/edit", "/update_restaurant"
        redirect_to("/restaurants/#{@restaurant.id}", :notice => "Restaurant updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Restaurant updated successfully.")
      end
    else
      render("restaurants/edit.html.erb")
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])

    @restaurant.destroy

    if URI(request.referer).path == "/restaurants/#{@restaurant.id}"
      redirect_to("/", :notice => "Restaurant deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Restaurant deleted.")
    end
  end
end
