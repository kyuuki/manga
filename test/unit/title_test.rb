# -*- coding: utf-8 -*-
require 'test_helper'

class TitleTest < ActiveSupport::TestCase

  test "title get" do
    title = Title.first

    assert_instance_of Title, title
  end

  test "title save" do
    title = Title.new({ :title => "name",
                        :author => "author",
                        :complete => false })
    assert title.save

    # 空のタイトル
    title = Title.new({ :title => "",
                        :author => "author",
                        :complete => false })
    assert title.save

    # 長いタイトル
    title = Title.new({ :title => "1234567890" * 26,  # TODO: 255 文字制限じゃなかった？要確認
                        :author => "author",
                        :complete => false })
    assert title.save
  end

  test "array_to_short_string" do
    assert_equal "1-3",     Title.array_to_short_string([1, 2, 3])
    assert_equal "2,3",     Title.array_to_short_string([2, 3])
    assert_equal "1,3",     Title.array_to_short_string([1, 3])
    assert_equal "3",       Title.array_to_short_string([3])
    assert_equal "2-5,7,8", Title.array_to_short_string([2, 3, 4, 5, 7, 8])
    assert_equal "2-5,7",   Title.array_to_short_string([2, 3, 4, 5, 7])
  end
end
