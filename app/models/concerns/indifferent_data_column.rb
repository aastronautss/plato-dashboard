##
# Included if you have a column called +data+ that you need accessed with indifferent access (such as a +jsonb+
# column).
#
module IndifferentDataColumn
  extend ActiveSupport::Concern

  def data
    attribute = read_attribute(:data)

    case attribute
    when Hash
      attribute.with_indifferent_access
    when Array
      attribute.map &:with_indifferent_access
    else
      attribute
    end
  end
end
