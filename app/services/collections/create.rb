module Collections
  class Create
    def self.call(params, user)
      new(params, user).call
    end

    def initialize(params, user)
      @params = params
      @user = user
    end

    def call
      create_collection
      update_each_user_analytics
    end

    private

    attr_reader :params, :user

    def create_collection
      user.collections.create(params)
    end

    def update_each_user_analytics
      user.update(list_number: user.collections.count)
    end
  end
end
