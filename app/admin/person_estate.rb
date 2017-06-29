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

  menu label: "Помещения-Люди"
  index title: "Помещения-Люди"
  # show do |pes|
  #  "#{pes.person.name} - #{pes.estate.name}"
  # end

  form do |f|
    f.inputs "PersonEstate" do
      f.input :estate, label: 'Помещение'
      f.input :person, label: 'Человек'
      f.input :person_estate_status, label: 'Статус'
      f.input :part, label: 'Часть собственности'
      f.input :regno, label: 'Гос.рег. номер'
      f.input :regdate, label: 'Дата регистрации права собственности', start_year: 2015, end_year: 2020
    end
    f.actions
  end
end
