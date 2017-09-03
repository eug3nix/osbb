ActiveAdmin.register Payment do

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
  permit_params :amount, :payment_type, :pay_date, :estate
  belongs_to :estate, optional: true

  # menu label: "Платежи"
  # index title: "Платежи"

  form do |f|
    f.object.pay_date = Date.today if f.object.pay_date.blank?
    f.inputs "Детали Платежа" do
      f.input :estate, label: "квартира"
      f.input :amount, label: "сумма"
      f.input :payment_type, label: "назначение платежа"
      f.input :pay_date, label: "дата оплаты"
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
