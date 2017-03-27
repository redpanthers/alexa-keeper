module Websites
  class Delete
    def self.call(params, user)
      new(params, user).call
    end

    def initialize(params, user)
      @params = params
      @user = user
    end

    def call
      delete_website
      find_or_create_user
    end

    private

    attr_reader :params, :user, :website

    def delete_website
      CollectionWebsite.where(collection_id: collection_id, website_id: params[:id]).destroy_all
    end

    def collection_id
      params[:collection_id]
    end

    def find_or_create_user
      site_urls = user.websites.map(&:url)
      websites_count = user.websites.count
      user.update(sites: site_urls, site_number: websites_count)
    end
  end
end
