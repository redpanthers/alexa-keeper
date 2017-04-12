require 'test_helper'

module Websites
  class CreateTest < ActiveSupport::TestCase
    test 'adding a new website' do
      user = users(:hari)
      collection = user.collections.create!(name: 'My Collection')

      params = { website: { url: 'http://twitter.com', collection_id: collection.id } }

      Websites::Create.call(params, user)

      user.reload
      assert_equal 1, user.websites.count, 'websites_count'
      assert_equal 1, Website.count
      assert_equal ['http://twitter.com'], user.websites.pluck(:url)
      assert_equal ['http://twitter.com'], collection.websites.pluck(:url)
    end

    test 'adding a new website without http prefix' do
      user = users(:hari)
      collection = user.collections.create!(name: 'My Collection')

      params = { website: { url: 'twitter.com', collection_id: collection.id } }

      Websites::Create.call(params, user)

      user.reload
      assert_equal 1, user.websites.count, 'websites_count'
      assert_equal 1, Website.count
      assert_equal ['http://twitter.com'], user.websites.pluck(:url)
      assert_equal ['http://twitter.com'], collection.websites.pluck(:url)
    end

    test 'does not create duplicate website' do
      user = users(:hari)
      collection = user.collections.create!(name: 'My Collection')
      Website.create!(url: 'http://twitter.com')

      params = { website: { url: 'http://twitter.com', collection_id: collection.id } }

      assert_no_difference 'Website.count' do
        Websites::Create.call(params, user)
      end

      user.reload
      assert_equal 1, user.websites.count
      assert_equal ['http://twitter.com'], user.websites.pluck(:url)
      assert_equal ['http://twitter.com'], collection.websites.pluck(:url)
    end
  end
end
