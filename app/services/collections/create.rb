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
      update_statistics
    end

    private

    attr_reader :params, :user

    def create_collection
      user.collections.create(params) 
    end

    def update_statistics
      Statistic.update_statistics(lists: Collection.count)
      user.update(list_number: user.collections.count)
    end
  end
end 