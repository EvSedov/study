module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        new_array = self
        def my_each_recurs(elements, &fnc)
          return self if elements.empty?

          first, *rest = elements
          fnc.call(first)
          my_each_recurs(rest, &fnc)
        end
        my_each_recurs(new_array, &func)
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
        new_array = MyArray.new([])
        my_reduce(new_array) do |memo, element|
          predicate = func.nil? ? element.nil? : func.call(element)
          memo << element unless predicate
          memo
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(memo = nil, &func)
        first, *rest = self
        if memo.nil?
          memo = first
          first, *rest = rest
        end
        memo = func.call(memo, first)
        return memo if rest.empty?

        MyArray.new(rest).my_reduce(memo, &func)
      end
    end
  end
end
