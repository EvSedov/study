module Exercise
  module Arrays
    class << self
      def get_max_element(array)
        max_element = array[0]
        for item in array do
          max_element = item if item > max_element
        end
        max_element
      end

      def replace(array)
        max_element_in_array = get_max_element(array)
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

        binary_search = lambda { |start_index, end_index|
          return -1 if start_index > end_index

          current_index = (end_index + start_index) / 2
          current_element = array[current_index]

          return current_index if current_element == query

          end_index = current_index - 1 if current_element > query
          start_index = current_index + 1 if current_element < query

          binary_search.call(start_index, end_index)
        }
        binary_search.call(0, array.length - 1)
      end
    end
  end
end
