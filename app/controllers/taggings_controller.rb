class TaggingsController < ApplicationController
  def index
    @taggings = Tagging.all

    render("taggings/index.html.erb")
  end

  def show
    @tagging = Tagging.find(params[:id])

    render("taggings/show.html.erb")
  end

  def new
    @tagging = Tagging.new

    render("taggings/new.html.erb")
  end

  def create
    @tagging = Tagging.new

    @tagging.restaurant_id = params[:restaurant_id]
    @tagging.tag_id = params[:tag_id]
    @tagging.user_id = params[:user_id]

    save_status = @tagging.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/taggings/new", "/create_tagging"
        redirect_to("/taggings")
      else
        redirect_back(:fallback_location => "/", :notice => "Tagging created successfully.")
      end
    else
      render("taggings/new.html.erb")
    end
  end

  def edit
    @tagging = Tagging.find(params[:id])

    render("taggings/edit.html.erb")
  end

  def update
    @tagging = Tagging.find(params[:id])

    @tagging.restaurant_id = params[:restaurant_id]
    @tagging.tag_id = params[:tag_id]
    @tagging.user_id = params[:user_id]

    save_status = @tagging.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/taggings/#{@tagging.id}/edit", "/update_tagging"
        redirect_to("/taggings/#{@tagging.id}", :notice => "Tagging updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Tagging updated successfully.")
      end
    else
      render("taggings/edit.html.erb")
    end
  end

  def destroy
    @tagging = Tagging.find(params[:id])

    @tagging.destroy

    if URI(request.referer).path == "/taggings/#{@tagging.id}"
      redirect_to("/", :notice => "Tagging deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Tagging deleted.")
    end
  end
end
