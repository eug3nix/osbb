ActiveAdmin.register PersonEstate do

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

  belongs_to :estate, optional: true
  permit_params :person_id, :estate_id, :person_estate_status_id, :regno, :regdate, :reg_reason, :part, :estate_id,
                person_attributes:[:lastname, :firstname, :middlename, :inn, :birthdate, :move_in_date, :notifiable]

  menu false
  # menu label: "Привязки"
  # index title: "Привязки" do
  #   column "Имя", :name
  #   column "Создан", :created_at
  #   column "Изменен", :updated_at
  #   actions
  # end

  form do |f|
    if f.object.new_record? 
      f.inputs "Человек", for: [:person, Person.new] do |person|
        person.input :lastname, label: 'Фамилия'
        person.input :firstname, label: 'Имя'
        person.input :middlename, label: 'Отчество'
        person.input :inn, label: 'ИНН'
  #      person.input :regnum
  #      person.input :regdate, label: 'Дата регистрации', start_year: 2010, order: [:day, :month, :year]
        person.input :birthdate, label: 'Дата рождения', start_year: 1940, order: [:day, :month, :year]
        person.input :move_in_date, label: 'Дата въезда(предпол.)', start_year: 2017, order: [:day, :month, :year]
        person.input :notifiable, label: 'Получать уведомления'
      end
    end

    f.inputs "Привязка" do
      f.input :estate, label: 'Помещение', input_html: { disabled: true }
      f.input :person, label: 'Человек', collection: Person.all.order(:lastname) unless f.object.new_record? 
      f.input :person_estate_status, label: 'Статус'
      f.input :part, label: 'Часть собственности'
      f.input :regno, label: 'Гос.рег. номер'
      f.input :reg_reason, label: 'Причина права собственности'
      f.input :regdate, label: 'Дата регистрации права собственности', start_year: 2015, end_year: 2020, order: [:day, :month, :year]
    end

    f.actions
  end

  controller do
    def create
      create! do |format|
        format.html {redirect_to admin_estate_path(resource.estate)}
      end
    end
  end
end
