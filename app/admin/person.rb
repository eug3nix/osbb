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
  permit_params :firstname, :lastname, :middlename, :inn,
                :birthdate, :move_in_date, :notifiable,
                estates_attributes:[:name], person_estsate_attributes: [:person_estate_status],
                person_estates_attributes: [:id, :estate_id, :person_id, :person_estate_status_id, :part]

  menu label: "Люди"
  index title: "Люди" do
    # selectable_column
    column "Фамилия", :lastname
    column "Имя", :firstname
    column "Отчество", :middlename
    column "ИНН", :inn
    column "Дата рождения", :birthdate
    column "Уведомлять?", :notifiable
    column "Дата въезда", :move_in_date
    column "Создан", :created_at
    column "Изменен", :updated_at
    # column "Гос. рег. номер", :regnum
    # column "Дата регистрации", :total_area
    # column "Жилая площадь", :living_area
    # column "Гос. рег. номер", :regnum
    actions
  end

  form do |f|
    f.inputs "Человек" do
      f.input :lastname, label: 'Фамилия'
      f.input :firstname, label: 'Имя'
      f.input :middlename, label: 'Отчество'
      f.input :inn, label: 'ИНН'
#      f.input :regnum
#      f.input :regdate, label: 'Дата регистрации', start_year: 2010, order: [:day, :month, :year]
      f.input :birthdate, label: 'Дата рождения', start_year: 1940, order: [:day, :month, :year]
      f.input :move_in_date, label: 'Дата въезда(предпол.)', start_year: 2017, order: [:day, :month, :year]
      f.input :notifiable, label: 'Получать уведомления'
    end

    # if f.object.new_record? 
    #   f.inputs "Привязка" do
    #     f.has_many :person_estates do |pes|
    #       pes.input :estate, label: "Помещение"
    #       pes.input :person_estate_status, label: "Статус"
    #       pes.input :part, label: "Часть собственности"
    #     end
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
#        column("Estate", sortable: :id) do |pes|
#         link_to "#{pes.estate_id}", admin_estate_path(pes.estate_id)
 #  end
         column("Тип") do |pes|
          "#{pes.estate.estate_type.name}"
        end

        column("Имя") do |pes|
          link_to "#{pes.estate.name}", admin_estate_path(pes.estate_id)
        end
        column("Статус") do |pes|
          "#{pes.person_estate_status.name}"
        end

        column("") do |pes|
          link_to "Просмотр", admin_person_estate_path(pes)
        end

        column("") do |pes|
          link_to "Редактировать", edit_admin_person_estate_path(pes)
        end

        column("") do |pes|
          link_to "Отвязать помещение", admin_person_estate_path(pes), :method => :delete, data: { confirm: 'Вы уверены?' }
        end

      end
    end

    panel "Контакты" do
      table_for(person.contacts) do
#        column("Contact", sortable: :id) do |ct|
 #         link_to "#{ct.id}", admin_person_contact_path(person, ct)
  #      end
        column("Тип") do |ct|
          "#{ct.contact_type.name}"
        end
        column("Значение") do |ct|
		link_to "#{ct.value}", admin_person_contact_path(person, ct)
        end
        column("Приватность") do |ct|
          "#{ct.private}"
        end

        column("") do |ct|
          link_to "Просмотр", admin_person_contact_path(person, ct)
        end

        column("") do |ct|
          link_to "Редактировать", edit_admin_person_contact_path(person, ct)
        end

        column("") do |ct|
          link_to "Удалить", admin_person_contact_path(person, ct), :method => :delete, data: { confirm: 'Are you sure?' }
        end

        tr class: "action_items" do
          td link_to("Добавить Контакт", new_admin_person_contact_path(person), class: :button)
        end
		
      end
    end


    active_admin_comments
  end

end
