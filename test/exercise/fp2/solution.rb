module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        for item in self
          func.call(item)
        end
      end

      # Написать свою функцию my_map
      def my_map(&func)
        new_array = []
        for item in self
          new_array << func.call(item)
        end
        MyArray.new(new_array)
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
      def my_reduce(memo = nil, operator = nil, &block)
        block = if operator == Symbol
                  ->(acc, value) { acc.send(operator, value) }
                elsif operator.nil?
                  block
                end
        new_array = self
        if memo.nil?
          new_array = self[1..-1]
          memo = self[0]
        end
        for item in new_array
          memo = block.call(memo, item)
        end
        memo
      end
    end
  end
end
