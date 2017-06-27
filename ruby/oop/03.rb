# encoding: UTF-8

class Cl

  # Атрибут инстанса (экземпляра класса) в том числе синглтона
  @var = 'Это атрибут инстанса в том числе синглтона.'

  # Методы доступа к атрибуту инстанса
  attr_accessor :var
  # Или так:
  def var
    @var
  end
  def var= value
    @var = value + ' Сработа метод инстанса var=.'
  end

  # Атрибут класса
  @@var = 'Это атрибут класса.'

  # Методы класса для доступа к атрибуту класса
  def self.var
    @@var
  end
  def self.var= value
    @@var = value + ' Сработал метод класса var=.'
  end

  # Инициализация синглтона класса
  class << self

    # Методы синглтона для доступа к атрибуту класса или синглтона класса
    attr_accessor :var
    # Или так:
    def var
      @@var
    end
    def var= value
      @@var = value
    end

    # Удаление метода класса
    undef :new

    # Назначение/переопределение метода класса
    def new
      super
    end
  end

  # Инициализация экземпляра класса
  def initialize
    self.var = 'Назначение занчения атрибуту через метод инстанса (var=).'
    @var = 'Назначение занчения атрибуту напрямую (без вызова метода var=).'
    # Инициализация локальной переменной
    var = 'Значение локальной переменной.'
  end
end

print 'Cl.var: '; p Cl.var
print 'Cl.var = 1, Cl.var: '; Cl.var = '1'; p Cl.var
print 'instance = Cl.new, instance.var: '; instance = Cl.new; p instance.var
print 'instance.var = 2, instance.var: '; instance.var = '2'; p instance.var
p '-----------------------'
print 'Cl.methods.include? :var: '; p Cl.methods.include? :var
print 'Cl.instance_methods.include? :var: '; p Cl.instance_methods.include? :var
print 'Cl.singleton_methods.include? :var: '; p Cl.singleton_methods.include? :var
