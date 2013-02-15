# -*- coding: utf-8 -*-
class Title < ActiveRecord::Base
  attr_accessible :author, :complete, :title
  has_many :books

  #
  # "1-4,7,8" といった文字列を取得
  #
  def books_string
    volumes = []
    books.each do |book|
      volumes.push book.volume
    end

    array_to_short_string(volumes.sort)
  end

  def array_to_short_string(array)
    ranges = []  # ex. [ "1-4", "6", "8-12", "15,16" ]
    range = nil  # ex. [ 2, 3, 4, 5]

    array.each do |i|
      if range.nil?
        range = [ i ]
      elsif range[-1] + 1 == i
        range.push i
      else
        ranges.push start_end_to_string(range[0], range[-1])
        range = [ i ]
      end
    end

    unless range.nil?
      ranges.push start_end_to_string(range[0], range[-1])
    end

    ranges.join(",")
  end

  def start_end_to_string(s, e)
    if s == e
      "#{s}"
    elsif s + 1 == e
      "#{s},#{e}"
    else
      "#{s}-#{e}"
    end
  end
end
