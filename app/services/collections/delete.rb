module Collections
  class Delete
    def self.call(collection, user)
      new(collection, user).call
    end

    def initialize(collection, user)
      @collection = collection
      @user = user
    end

    def call
      delete_collection
      update_user_statistics
    end

    private

    attr_reader :user, :collection

    def delete_collection
      collection.destroy
    end

    def update_user_statistics
      site_urls = user.websites.map(&:url)
      websites_count = user.websites.count
      lists_count = user.collections.count
      user.update(sites: site_urls, site_number: websites_count,
                  list_number: lists_count)
    end
  end
end
