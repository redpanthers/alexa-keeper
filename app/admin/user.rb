ActiveAdmin.register User do
    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    filter :name
    filter :email
    filter :created_at

    index do
        selectable_column
        id_column
        column :name
        column :email
        column :created_at
        column :sign_in_count
        actions
    end
    permit_params :name, :email, :password, :password_confirmation

    form do |f|
        f.inputs 'User' do
            f.input :name
            f.input :email
            f.input :password
            f.input :password_confirmation
        end
        f.actions
    end
end
