ActiveAdmin.register AdminUser do
  form do |f|
    f.inputs :name => I18n.t("activerecord.models.admin_user.one") do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end

  index do
    column :name
    column :email
    default_actions
  end
end
