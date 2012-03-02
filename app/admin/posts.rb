ActiveAdmin.register Post do
  form do |f|
    f.inputs :name => I18n.t("activerecords.models.post.one") do
      f.input :title
      f.input :teaser
      f.input :text, :as => :ckeditor
      f.input :tags
      f.input :published
      f.input :author
    end
    f.buttons
  end

  index do
    column :title
    column :published
    column :author
    column :updated_at
    default_actions
  end
end
