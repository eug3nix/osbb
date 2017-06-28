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
  permit_params :firstname, :lastname, :middlename, :inn, :regnum, :regdate, :property_part, :birthdate,
                :move_in_date, estates_attributes:[:name], person_estsate_attributes: [:person_estate_status]

    form do |f|
      f.inputs "Персона" do 
        f.input :firstname, label: 'Имя'
        f.input :lastname, label: 'Фамилия'
        f.input :middlename, label: 'Отчество'
        f.input :inn, label: 'ИНН'
        f.input :regnum
        f.input :regdate, label: 'Дата Регистрации', start_year: 2010
        f.input :birthdate, label: 'Дата Рождения', start_year: 1940
      end

      f.inputs "Объект" do
        f.has_many :estates do |estate|
          estate.input :name, label: "Имя Объекта"
          estate.input :estate_type, label: "Тип"
          estate.input :floor, label: "Этаж"
          estate.input :rooms, label: "Комнат"
          estate.input :total_area, label: "Общая площадь"
          estate.input :living_area, label: "Жилая площадь"
          estate.input :regnum, label: "Рег номер объекта недвижимости"

        end
      end

      f.actions
    end

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
