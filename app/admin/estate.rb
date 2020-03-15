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
  permit_params :name, :section, :floor, :rooms, :total_area, :living_area, :regnum, :estate_type_id
  includes :estate_type
  menu label: "Помещения"

  index title: 'Помещения' do
    # selectable_column
    column "Тип", :type
    column "Имя", :name
    column "Секция", :section
    column "Этаж", :floor
    column "Комнат", :rooms
    column "Общая площадь", :total_area
    column "Жилая площадь", :living_area
    column "Гос. рег. номер", :regnum
    actions
  end

  show title: :estate_title do |est|

    attributes_table do
      row ('Тип') {estate.estate_type.name}
      row ('Имя') {estate.name}
      row ('Секция') {estate.section}
      row ('Этаж') {estate.floor}
      row ('Комнат') {estate.rooms}
      row ('Общая площадь') {estate.total_area}
      row ('Жилая площадь') {estate.living_area}
      row ('Гос. рег. номер объекта') {estate.regnum}
    end

    panel "Люди" do
      table_for(estate.person_estates.joins(:person).order('people.lastname')) do |pes|
        column "Человек" do |pes|
            link_to pes.person.fullname, admin_person_path(pes.person)
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

        column("") do |pes|
          link_to "Просмотр", admin_person_estate_path(pes)
        end

        column("") do |pes|
          link_to "Редактировать", edit_admin_person_estate_path(pes)
        end

        column("") do |pes|
          link_to "Отвязать человека", admin_person_estate_path(pes), method: :delete, data: { confirm: 'Вы уверены?' }
        end

        tr class: "action_items" do
          td link_to("Добавить Человека", new_admin_estate_person_estate_path(estate_id: estate.id), class: :button)
        end

      end
    end

    panel "Платежи" do
      table_for(estate.payments) do |pay|
        column "Сумма" do |pay|
            pay.amount
        end

        column "Назначение платежа" do |pay|
            pay.payment_type
        end

        column "Дата оплаты" do |pay|
            pay.pay_date
        end

        column("") do |pay|
          link_to "Просмотр", admin_payment_path(pay)
        end

        column("") do |pay|
          link_to "Редактировать", edit_admin_payment_path(pay)
        end

        column("") do |pay|
          link_to "Удалить Платеж", admin_payment_path(pay), method: :delete, data: { confirm: 'Вы уверены?' }
        end

        tr class: "action_items" do
          td link_to("Добавить Платеж", new_admin_estate_payment_path(estate_id: estate.id), class: :button)
        end
      end
    end

    panel "Транспортные средства" do
      table_for(estate.cars) do |car|
        column "Модель" do |car|
            car.model
        end

        column "Рег Номер" do |car|
            car.reg_number
        end

        column("") do |car|
          link_to "Просмотр", admin_car_path(car)
        end

        column("") do |car|
          link_to "Редактировать", edit_admin_car_path(car)
        end

        column("") do |car|
          link_to "Удалить", admin_car_path, method: :delete, data: { confirm: 'Вы уверены?' }
        end

        tr class: "action_items" do
          td link_to("Добавить Транспорт", new_admin_estate_car_path(estate_id: estate.id), class: :button)
        end
      end
    end
    active_admin_comments
  end
end
