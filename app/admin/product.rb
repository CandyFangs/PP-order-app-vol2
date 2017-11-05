ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :kind, :category_id, :model, :description, :price, :picture

    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Product", :multipart => true do
        f.input :kind
        f.input :category_id, :as => :select, :collection => Category.pluck(:name, :id)
        f.input :model
        f.input :description
        f.input :price
        f.input :picture
      end
      f.submit
    end

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
