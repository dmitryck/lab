# encoding: UTF-8

arr = 'asd'
h = {
  :r => "Камень",
  :arr => arr,
  :Mike => 214134,
  :jes => '1432352',
  0 => ['asd'],
  asdf: ['asd'],
}
p h

# Добавить новый элемент
h[3] = '3'
# h[:mike] = 'test'
p h
p h[:Mike]

# Имеется ли элемент с ключем
if h.key? :mike
  p h[:mike]
end
p h[0]
p h[3]

# Перебор
h.each do |key,value|
  print key.to_s + ' - '
  print value.to_s
  print "\n"
end

# Количество элементов
p h.count

# Удалить элемент с ключем :a
h.delete("a")

p nil&&nil