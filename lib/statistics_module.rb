module Statistacable

  # sort array based on value
  def sort_based_on_value(array)
    array.to_h.sort_by {|key, value| value}
  end

end

