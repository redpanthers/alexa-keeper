ActiveAdmin.register_page 'Dashboard' do
    menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

    content title: proc { I18n.t('active_admin.dashboard') } do
        # Here is an example of a simple dashboard with columns and panels.
        #
        columns do
            column do
                sites = []
                Website.all.map do |site|
                    if site.alexaranks.where('created_at >= ?',
                                                 Time.zone.now.beginning_of_day)
                               .count.zero?
                        sites.push(site.url)
                    end
                end
                panel 'Failed Domains' do
                    ul do
                        if sites.any?
                          sites.each do |site|
                            li site
                          end
                        else
                          "No failed domains"
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
