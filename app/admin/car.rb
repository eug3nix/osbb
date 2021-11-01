ActiveAdmin.register Car do

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
  permit_params :estate_id, :reg_number, :model
  belongs_to :estate, optional: true

  #menu label: "Транспорт"
  index title: "Машины" do
    column "Помещение", :estate
    column "Рег. номер", :reg_number
    column "Модель", :model
    column "Создан", :created_at
    column "Изменен", :updated_at
    actions
  end

  form do |f|
    f.inputs "Car" do
      f.input :estate, label: 'помещение', collection: Estate.all.order(:id)# unless f.object.new_record? 
      f.input :reg_number, label: 'Рег. номер'
      f.input :model, label: 'Модель'
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
