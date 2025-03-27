import random
from turtle import *

class Car:
    def __init__(self, speed, color,fname):
        self.speed = speed
        self.color = color
        self.turtle = Turtle()
        self.turtle.shape(fname)
        self.turtle.speed(self.speed)

    def drive(self, distance):
        self.turtle.forward(distance)

    def turnleft(self, degree):
        self.turtle.left(degree)

register_shape("car2.gif")

car_list = []
for _ in range(10):
    car_list.append(Car(random.randint(1,10),"red", "car2.gif"))

for _ in range(10):
    for car in car_list:
            car.drive(random.randint(50, 100))
            car.turnleft(random.choice([10, 90, 180, 270]))

