ActiveAdmin.register Color do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :color, :material_id, :picture

    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Color", :multipart => true do
        f.input :color, :as => :text, input_html: {rows: 1}
        f.input :material_id, :as => :select, :collection => Material.pluck(:brand, :id)
        f.input :picture
      end
      f.submit
    end

# form do |f|
#     f.inputs "Upload" do
#       f.input :color
#       f.input :picture, required: true, as: :file
#     end
#     f.actions
#   end
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
