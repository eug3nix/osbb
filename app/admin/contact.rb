ActiveAdmin.register Contact do

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
  permit_params :person_id, :contact_type_id, :value, :private
  belongs_to :person

  controller do
    def create
      create! do |format|
        format.html {redirect_to admin_person_path(resource.person)}
      end
    end
  end

end
