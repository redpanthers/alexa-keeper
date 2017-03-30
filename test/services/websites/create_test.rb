require 'test_helper'

class Websites::CreateTest < ActiveSupport::TestCase
  test 'adding a new website' do
    user = users(:hari)
<<<<<<< HEAD
    collection = user.collections.create!(name: 'My Collection') 
=======
    collection = user.collections.create!(name: 'My Collection')
>>>>>>> master

    params = { website: { url: 'twitter.com', collection_id: collection.id } }

    Websites::Create.call(params, user)

<<<<<<< HEAD
    user.reload
    assert_equal 1, user.site_number
=======
    # byebug

    user.reload
    assert_equal 1, user.site_number, 'site number'
>>>>>>> master
    assert_equal 1, Website.count
    assert_equal ['twitter.com'], user.websites.pluck(:url)
    assert_equal ['twitter.com'], collection.websites.pluck(:url)
  end

  test 'does not create duplicate website' do
    user = users(:hari)
    collection = user.collections.create!(name: 'My Collection')
    website = Website.create!(url: 'twitter.com')

    params = { website: { url: 'twitter.com', collection_id: collection.id } }

    assert_no_difference 'Website.count' do
      Websites::Create.call(params, user)
    end

    user.reload
    assert_equal 1, user.site_number
    assert_equal ['twitter.com'], user.websites.pluck(:url)
    assert_equal ['twitter.com'], collection.websites.pluck(:url)
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> master
