### Notes on Boris Bikes exercise - part 1.
File includes exercises 1 - 11.

##### Docking_station.rb so far

```ruby
class DockingStation
  def release_bike
    return Bike.new
  end
end
```
`DockingStation` class contains one method - `release_bike`,
which returns a new instance of a class `Bike` when called.

##### Bike.rb so far

```ruby
class Bike
  def working?
    true
  end
end
```
`Bike` class contains one method - `working?`,
which returns `true` if the `Bike` is working (at this point we're supposed to assume that the bike is working, hence true).

* Calling a method `xxx?` (name + question mark at the end) turns out to be a particularly good idea when it comes to testing - see notes concerning this line (expect(bike).to be_working ) of DockingStation test.

* At first my partner and I have created a new instance of class `Bike` (`bike = Bike.new`) inside the bike.rb file. It turned out that it broke the tests - new instances of class should be created in irb instead of .rb files.

##### Bike_spec.rb so far

```ruby
require 'bike'

describe Bike do
  it {is_expected.to respond_to :working?}
end
```
This test works for class `Bike` (and therefore each new instance of class `Bike`). In other words - each time we create a new instance of class `Bike` e.g.
```ruby
 justine_bike = Bike.new
 carlos_bike = Bike.new
```
we're sure it will be able to use `working?` method.

Analyzing the test step by step: <br>
* `it` - refers to an instance of Bike class; <br>
* `is_expected.to` - this instance is expected to... <br>
* `respond_to` - :) <br>
* ``:working?`` - we describe the method to which the instance variable should respond to.

##### Docking_station_spec.rb so far

```ruby
require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}
  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
end
```

As in case of `Bike`, this test works for instances of `DockingStation` class and there is no need to create instances of class `DockingStation` inside the docking_station.rb file. <br><br>
Analyzing the test step by step: <br>
<br>
*First part is the same as in case of Bike class* <br>

* `it` - refers to an instance of DockingStation class; <br>
* `is_expected.to` - as above <br>
* `respond_to` - as above <br>
* `release_bike` - as above.

*Second part differs* <br>

* `it 'releases working bikes' do` - we describe what each instance of class `DockingStation` should do. In this case - it should release working bikes. <br>
* `bike = subject.release_bike` - So this is tricky. `Subject` works as `self` - using `subject` means that we're calling a method (in this case `release_bike`) on the tested instance of class `DockingStation`. The `release_bike` method we've defined in docking_station.rb file is returning a new instance of class `Bike`, which we will call `bike`.
* `expect(bike).to be_working` - We expect that when we call method `working?` on `bike` - an instance of class `Bike` created in the previous step - it will return `true`. This is because literally say that we **expect** bike to **be_working**. <br>

Let's take a closer look at the syntax.

* If the method's name was 'crying?' and we would want the `bike` to cry, then we would write:
```ruby
expect(bike).to be_crying
```

* If we would like the bike not to cry, then we would have to write that we **expect** bike **not_to** be_crying:
```ruby
expect(bike).not_to be_crying
```
Shall the crying? method return false,
```ruby
class Bike
    def crying?
      false
    end
end

```
then the test will be passed as the `bike` is indeed not crying (we expect it `not_to` `be_crying`). In case the method returns `true`, the test won't be passed.

* Now it's easy to see why naming the method which returns boolean as `xxx?` (with question mark) comes pretty handy and is intuitive.
