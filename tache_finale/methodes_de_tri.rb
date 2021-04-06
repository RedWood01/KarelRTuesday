
class Tri < UrRobot
	@tri_strategy = nil
	def initialize (street, avenue, direction, beepers)
    	super(street, avenue, direction, beepers)
    	@tri_strategy = NullStrategy.new()
    end

    def set_strategy(strategy)
    	@tri_strategy = strategy
    end

    def tri
    	@tri_strategy.tri(self)
    end
end

class Strategie
	def tri(matrice)
		raise NotImplementedError.new("Strategie pas implemente")
	end
end

class BullesStrategie < Strategy

	def tri(matrice)

		len =  matrice.length

		i = 0
		j = 1
		tmp = 0

		while i < len
			j = 1
			while j < (len - i)
				if matrice[j-1] > matrice[j]
					tmp = matrice[j]
					matrice[j] = matrice[j-1]
					matrice[j-1] = tmp
				end
				j = j + 1
			end

			i = i+1
		end

		puts tri_bulles(arr)
		puts "tri_bulles"
		puts "_______________"


		return matrice
	end
end

class SelectionStrategie < Strategy

	def tri(matrice)

		len =  matrice.length

		i = 0
		j = 1
		tmp = 0

		while i < len -1
			j = i+1
			plus_petit = i
			while j < (len)
				if matrice[plus_petit] > matrice[j]
					plus_petit = j
				end
				j = j + 1
			end
			tmp = matrice[i]
			matrice[i] = matrice[plus_petit]
			matrice[plus_petit] = tmp

			i = i+1
		end

		puts tri_selection(arr)
		puts "tri_selection"
		puts "_______________"

		return matrice

	end
end

class FusionStrategie < Strategy

	def tri(matrice)

		num_elements = matrice.length
		if num_elements <= 1
		  return matrice
		end

		half_of_elements = (num_elements / 2).round

		left  = matrice.take(half_of_elements)
		right = matrice.drop(half_of_elements)

		sorted_left = tri_fusion(left)
		sorted_right = tri_fusion(right)

		merge(sorted_left, sorted_right)

		puts tri_fusion(arr)
		puts "fusion"
		puts "_______________"
	end

	def merge(left_array, right_array)
		if right_array.empty?
	 	 return left_array
		end

		if left_array.empty?
	 	 return right_array
		end

		smallest_number = if left_array.first <= right_array.first
	  	 left_array.shift
		else
	 	 right_array.shift
		end

		recursive = merge(left_array, right_array)

		[smallest_number].concat(recursive)
	end
end

arr = []

9.times do 
	arr << rand(1..100)
end

tri = Tri.new(1, 1, NORTH, 0)
tri.set_strategy(FusionStrategie.new)
tri.tri