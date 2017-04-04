ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        sites = []

        Website.all.each do |site|
          sites << site.url if site.alexaranks.for_today.exists?
        end

        panel 'Failed Domains' do
          ul do
            if sites.any?
              sites.each { |site| li site }
            else
              'No failed domains'
            end
          end
        end
      end

      column do
        panel 'Info' do
          'Welcome to admin dashboard'
        end
      end
    end
  end # content
end
