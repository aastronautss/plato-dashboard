##
# Included if you have a column called +data+ that you need accessed with indifferent access (such as a +jsonb+
# column).
#
module IndifferentDataColumn
  extend ActiveSupport::Concern

  def data
    read_attribute(:data)&.with_indifferent_access
  end
end
