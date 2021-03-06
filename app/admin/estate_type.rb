ActiveAdmin.register EstateType do

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
  permit_params :name

  menu label: "Типы помещений"
  index title: "Типы помещений" do
    column "Имя", :name
    column "Создан", :created_at
    column "Изменен", :updated_at
    actions
  end

end
