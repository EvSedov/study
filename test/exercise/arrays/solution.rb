module Exercise
  module Arrays
    class << self
      def replace(array)
        max_element_in_array = array[0]
        for item in array do
          item > max_element_in_array && max_element_in_array = item
        end
        new_array = []
        for item in array do
          new_element = (item.positive? ? max_element_in_array : item)
          new_array << new_element
        end
        new_array
      end

      def search(array, query)
        return -1 if array.empty?
        return array[0] == query ? 0 : -1 if array.length == 1

        iter = lambda { |start_index, end_index|
          return -1 if start_index > end_index

          current_index = (end_index + start_index) / 2
          current_element = array[current_index]

          return current_index if current_element == query

          end_index = current_index - 1 if current_element > query
          start_index = current_index + 1 if current_element < query

          iter.call(start_index, end_index)
        }
        iter.call(0, array.length - 1)
      end
    end
  end
end
