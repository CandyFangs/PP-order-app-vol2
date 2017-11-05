ActiveAdmin.register Element do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :product_id, :material_id, :name

# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Element", :multipart => true do
        f.input :name
        f.input :material_id, :as => :select, :collection => Material.pluck(:brand, :id)
        f.input :product_id, :as => :select, :collection => Product.pluck(:model, :id)
      end
      f.submit
    end
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
