ActiveAdmin.register Person do

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
  permit_params :firstname, :lastname, :middlename, :inn, :regnum, :regdate, :property_part, :birthdate, :move_in_date

  show title: :name do
    panel "Сведения о персоне" do
      attributes_table_for person
    end
    panel "Привязки к недвижимости" do
      table_for(person.estates) do
        column("Estate", sortable: :id) do |est|
          link_to "#{est.id}", admin_estate_path(est)
        end
        column("Name") do |est|
          "#{est.name}"
        end
        column("Type") do |est|
          "#{est.estate_type.name}"
        end
      end
    end
    active_admin_comments
  end

end
