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
  permit_params :firstname, :lastname, :middlename, :inn, :regnum, :regdate, :property_part,
                :birthdate, :move_in_date, :notifiable,
                estates_attributes:[:name], person_estsate_attributes: [:person_estate_status],
                person_estates_attributes: [:id, :estate_id, :person_id, :person_estate_status_id, :part]

  menu label: "Люди"
  index title: "Люди"

  form do |f|
    f.inputs "Человек" do
      f.input :lastname, label: 'Фамилия'
      f.input :firstname, label: 'Имя'
      f.input :middlename, label: 'Отчество'
      f.input :inn, label: 'ИНН'
      f.input :regnum
      f.input :regdate, label: 'Дата регистрации', start_year: 2010
      f.input :birthdate, label: 'Дата рождения', start_year: 1940
      f.input :move_in_date, label: 'Дата въезда(предпол.)', start_year: 2017
      f.input :notifiable, label: 'Получать уведомления'
    end

    # f.inputs "Люди-Помещения" do
    #   f.has_many :person_estates do |pes|
    #     pes.input :estate, label: "Помещение"
    #     pes.input :person_estate_status, label: "Статус"
    #     pes.input :part, label: "Часть собственности"
    #   end
    # end

    # f.inputs "Помещение" do
    #   f.has_many :estates do |estate|
    #     estate.input :name, label: "Имя помещения"
    #     estate.input :estate_type, label: "Тип"
    #     estate.input :floor, label: "Этаж"
    #     estate.input :rooms, label: "Кол-во комнат"
    #     estate.input :total_area, label: "Общая площадь"
    #     estate.input :living_area, label: "Жилая площадь"
    #     estate.input :regnum, label: "Гос.рег номер помещения"
    #   end
    # end

    f.actions
  end

  show title: :fullname do
    attributes_table do
      row ('Фамилия') {person.lastname}
      row ('Имя') {person.firstname}
      row ('Отчество') {person.middlename}
      row ('ИНН') {person.inn}
      row ('Дата рождения') {person.birthdate}
      row ('Дата въезда') {person.move_in_date}
      row ('Получать уведомления') {person.notifiable}
    end
    panel "Помещения человека" do
      table_for(person.person_estates) do
        column("Estate", sortable: :id) do |pes|
          link_to "#{pes.estate_id}", admin_estate_path(pes.estate_id)
        end
        column("Name") do |pes|
          "#{pes.estate.name}"
        end
        column("Type") do |pes|
          "#{pes.estate.estate_type.name}"
        end
        column("Status") do |pes|
          "#{pes.person_estate_status.name}"
        end
      end
    end
    active_admin_comments
  end

end
