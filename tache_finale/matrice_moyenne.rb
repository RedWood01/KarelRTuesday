#moyenne = 6
matrice = [5, 6, 2, 66, 5, 22, 6, 7, 8, 25, 72, 77777, 1]

m = 0
n = 0

len = matrice.length

len.times do
	m + matrice[n] = matrice[0]
	n = n+1
end
matrice[n] = m
m / 13.0 == m
puts "----------"
puts m
