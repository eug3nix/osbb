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
  permit_params :person_id, :estate_id, :person_estate_status_id, :regno, :regdate, :part

  menu label: "Привязки"
  index title: "Привязки"
  # show do |pes|
  #  "#{pes.person.name} - #{pes.estate.name}"
  # end

  form do |f|
    f.inputs "PersonEstate" do
      f.input :estate, label: 'Объект'
      f.input :person, label: 'Персона'
      f.input :person_estate_status, label: 'Статус'
      f.input :part, label: 'Часть Собственности'
      f.input :regno, label: 'Рег. Номер'
      f.input :regdate, label: 'Дата Регистрации Права Собственности', start_year: 2015, end_year: 2020
    end
    f.actions
  end
end
