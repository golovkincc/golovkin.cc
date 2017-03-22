ActiveAdmin.register Post do
  permit_params :lang, :active, :sort, :published_at, :name, :picture, :words, :author, :ref, :user_id

  menu label: I18n.t('activerecord.models.post.few'),
       priority: 0

  index do
    selectable_column
    id_column
    column I18n.t('activerecord.attributes.post.lang'), :lang
    column I18n.t('activerecord.attributes.post.active'), :active
    column I18n.t('activerecord.attributes.post.sort'), :sort
    column I18n.t('activerecord.attributes.post.published_at'), :published_at
    column I18n.t('activerecord.attributes.post.name'), :name
    column I18n.t('activerecord.attributes.post.author'), :author
    actions defaults: false do |post|
      item I18n.t('active_admin.view'), admin_post_path(post)
      item I18n.t('active_admin.edit'), edit_admin_post_path(post)
      item I18n.t('active_admin.delete'),
           admin_post_path(post),
           method: :delete
    end
  end

  filter :lang
  filter :active
  filter :published_at
  filter :name
  filter :author

  show do
    attributes_table do
      row (I18n.t('activerecord.attributes.post.lang')) { post.lang }
      row (I18n.t('activerecord.attributes.post.active')) { status_tag post.active }
      row (I18n.t('activerecord.attributes.post.sort')) { post.sort }
      row (I18n.t('activerecord.attributes.post.published_at')) { post.published_at }
      row (I18n.t('activerecord.attributes.post.name')) { post.name }
      row (I18n.t('activerecord.attributes.post.picture')) { post.picture }
      row (I18n.t('activerecord.attributes.post.words')) { post.words }
      row (I18n.t('activerecord.attributes.post.author')) { post.author }
      row (I18n.t('activerecord.attributes.post.ref')) { post.ref }
    end
  end

  form do |f|
    f.semantic_errors
    f.input :lang, label: I18n.t('activerecord.attributes.post.lang'), as: :select, collection: I18n.available_locales
    f.input :active, label: I18n.t('activerecord.attributes.post.active')
    f.input :sort, label: I18n.t('activerecord.attributes.post.sort')
    f.input :published_at, label: I18n.t('activerecord.attributes.post.published_at'), as: :datepicker
    f.input :name, label: I18n.t('activerecord.attributes.post.name')
    f.input :picture, label: I18n.t('activerecord.attributes.post.picture')
    f.input :words, label: I18n.t('activerecord.attributes.post.words'), as: :ckeditor
    f.input :author, label: I18n.t('activerecord.attributes.post.author')
    f.input :ref, label: I18n.t('activerecord.attributes.post.ref')
    f.actions
  end
end
