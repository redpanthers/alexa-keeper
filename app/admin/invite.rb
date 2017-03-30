ActiveAdmin.register Invite do
  index do
    selectable_column
    id_column
    column :name
    column :email

    actions do |invitation|
      unless invitation.approved?
        link_to 'Approve', approve_invite_path(invitation), method: :put
      end
    end
  end
end
