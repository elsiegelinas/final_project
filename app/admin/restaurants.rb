ActiveAdmin.register Restaurant do

 permit_params :name, :description, :address, :forecast_rating, :number_of_reviews, :google_rating, :opentable_rating, :infatuation_rating, :tripadvisor_rating, :yelp_rating, :eater_list, :infatuation_list, :other_top_list, :neighborhood_id, :price, :cuisine_id, :hours
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
