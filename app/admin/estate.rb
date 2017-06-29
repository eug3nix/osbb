ActiveAdmin.register Estate do

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
  permit_params :name, :floor, :rooms, :total_area, :living_area, :regnum, :estate_type_id
  menu label: "Помещения"
  index title: "Помещения"

  show title: :name do
    panel "Сведения о помещении" do
      attributes_table_for estate
    end
    panel "Люди" do
      table_for(estate.person_estates) do |pes|
	  
        column("Привязка", sortable: :id) do |pes|
          link_to "#{pes.id}", admin_person_estate_path(pes)
        end

        column "Человек" do |pes|
            pes.person.name
        end

        column "Статус" do |pes|
            pes.person_estate_status.name
        end

        column "Часть" do |pes|
            pes.part
        end

        column "Гос. рег. номер" do |pes|
            pes.regno
        end

        column "Дата регистрации" do |pes|
            pes.regdate
        end

      end
    end
    active_admin_comments
  end
end
