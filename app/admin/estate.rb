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

    attributes_table do
      row ('Имя') {estate.name}
      row ('Тип') {estate.estate_type.name}
      row ('Этаж') {estate.floor}
      row ('Комнат') {estate.rooms}
      row ('Общая площадь') {estate.total_area}
      row ('Жилая площадь') {estate.living_area}
      row ('Гос. рег. номер объекта') {estate.living_area}
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
