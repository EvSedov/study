module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        new_array = self
        my_each_recurs = lambda { |elements, &fn|
          return self if elements.empty?

          first, *rest = elements
          fn.call(first)
          my_each_recurs.call(rest, &fn)
        }
        my_each_recurs.call(new_array, &func)
      end

      # Написать свою функцию my_map
      def my_map(&func)
        new_array = MyArray.new([])
        my_reduce(new_array) do |memo, element|
          memo << func.call(element)
        end
      end

      # Написать свою функцию my_compact
      def my_compact(&func)
        new_array = []
        for item in self
          predicate = func.nil? ? item.nil? : func.call(item)
          new_array << item unless predicate
        end
        MyArray.new(new_array)
      end

      # Написать свою функцию my_reduce
      def my_reduce(memo = nil, &block)
        new_array = self
        my_reduce_recurs = lambda { |elements, acc, &fn|
          return acc if elements.empty?

          first, *rest = elements
          if acc.nil?
            acc = first
            first, *rest = rest
          end
          acc = fn.call(acc, first)
          my_reduce_recurs.call(rest, acc, &fn)
        }
        my_reduce_recurs.call(new_array, memo, &block)
      end
    end
  end
end
