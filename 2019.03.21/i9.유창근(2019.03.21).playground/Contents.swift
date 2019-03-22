import UIKit

var str = "Hello, playground"

class Animal {
    var brain: Bool
    var legs: Int
    
    init(brain: Bool = true, legs: Int = 0) {
        self.brain = brain
        self.legs = legs
    }
}

class Human: Animal {
    init() {
        super.init()
        self.legs = 2
    }
}

class Pet: Animal {
    var fleas: Int
    init() {
        self.fleas = 0
        
        super.init()
        self.legs = 4
    }
}

class Dog: Pet {
    init(fleas: Int = 8) {
        super.init()
        self.fleas = fleas
    }
}

class Cat: Pet {
    init(fleas: Int = 4) {
        super.init()
        self.fleas = fleas
    }
}

let dog = Dog()
let cat = Cat()
let human = Human()
print(human.legs)
print(dog.fleas)
print(cat.fleas)

///////2

protocol 계산 {
    func 넓이()
    func 둘래()
    func 부피()
}

class Shape{
    var pi = 3.14
    var value1: Double
    var value2: Double
    var value3: Double
    var value4: Double
    
    init(_ value1: Double, _ value2: Double, _ value3: Double, _ value4: Double) {
        self.value1 = value1
        self.value2 = value2
        self.value3 = value3
        self.value4 = value4
    }
    
    func 넓이() -> Double {
        return value1 * value2
    }
    
    func 둘래() -> Double {
        return (value1 + value2) * 2
    }
    
    func 부피() -> Double {
        return value1 * value2 * value3
    }
}

class Square: Shape{
    init(x value1: Double, y value2: Double) {
        super.init(value1, value2, value1, value2)
        
    }
}

class Rectangle: Square{
}

class Circle: Shape {
    init(r value1: Double) {
        super.init(value1, 0, 0, 0)
    }
    
    override func 넓이() -> Double {
        return pi * value1 * value1
    }
    
    override func 둘래() -> Double {
        return 2 * pi * value1
    }
}

class Triangel: Shape {
    init(b value1: Double, h value2: Double) {
        super.init(value1, value2, 0, 0)
    }
    
    override func 넓이() -> Double {
        return value1 * value2 / 2.0
    }
}

class Trapezoid: Shape {
    init(a value1: Double, b value2: Double, h value3: Double) {
        super.init(value1, value2, value3, 0)
    }
    
    override func 넓이() -> Double {
        return (value1 + value2) * value3 / 2.0
    }
}

class Cube: Shape {
    init(s1 value1: Double, s2 value2: Double, h value3: Double) {
        super.init(value1, value2, value3, 0)
    }
}

class RectangularSolid: Shape {
    init(l value1: Double, w value2: Double, h value3: Double) {
        super.init(value1, value2, value3, 0)
    }
}

class CircularCylinder: Shape {
    init(r value1:Double, h value2: Double) {
        super.init(value1, value2, 0, 0)
    }
    
    override func 부피() -> Double {
        return pi * value1 * value1 * value2
    }
}

class Sphere: Shape {
    init(r value1: Double) {
        super.init(value1, 0, 0, 0)
    }
    
    override func 부피() -> Double {
        return 4.0 / 3.0 * pi * value1 * value1 * value1
    }
}

class Cone: Shape {
    init(r value1: Double, h value2: Double) {
        super.init(value1, value2, 0, 0)
    }
    
    override func 부피() -> Double {
        return pi * value1 * value1 * value2 / 3
    }
}

let square = Square(x:5,y:5)
print(square.넓이())
print(square.둘래())

let rectangle = Rectangle(x:5,y:5)
print(rectangle.넓이())
print(rectangle.둘래())

let circle = Circle(r:10)
print(circle.넓이())
print(circle.둘래())

let triangle = Triangel(b: 10, h: 10)
print(square.넓이())
print(square.둘래())

let trapezoid = Trapezoid(a: 10, b: 5, h: 4)
print(square.넓이())
print(square.둘래())

let cube = Cube(s1: 5, s2: 5, h: 5)
print(cube.부피())

let rectangularsoid = RectangularSolid(l: 5, w: 5, h: 5)
print(rectangularsoid.부피())

let circularCylinder = CircularCylinder(r: 5, h: 10)
print(circularCylinder.부피())

let sphere = Sphere(r: 10)
print(sphere.부피())

let cone = Cone(r: 5, h: 10)
print(cone.부피())
