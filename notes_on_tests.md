## Notes on rspec tests from Boris bikes.
Includes exercises 1 - 17.

#### Checking if methods are answering properly.

```ruby
  it { is_expected.to respond_to :release_bike}
```
* Instances of `DockingStation` class should respond to `release_bike` method.

```ruby
  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to be_instance_of(Bike)
  end
```

* For the purpose of testing the `dock` method, we first need to create an instance of class `Bike`; we call it `bike`.
* We dock this `bike` using the `dock` method called on the `subject` (self).
  * We needed to dock a `bike` to check if the `release_bike` method is working - we cannot test the method that releases bikes before having any bikes docked.
* We expect that when the station will release `bike`, it will be an instance of class `Bike`.

```ruby
  it { is_expected.to respond_to(:dock).with(1).argument }
```
* Checks if instances of class `DockingStation` respond to method `dock` with one argument.

```ruby
  it 'docks bike' do
     bike = Bike.new
     expect(subject.dock(bike)).to eq [bike]
   end
```
* For the purpose of testing the dock method, we first need to create an instance of class `Bike` - bike.
* We expect that when we dock the bike in a station (subject), this bike will be put to an array.

#### Checking if errors are being raised.

```ruby
  describe '#dock' do
    it 'raises error when full' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end
```
* First, we `dock` in the station a `capacity` - number of new instances of class `Bike` ( capacity.times works like xxx.times, where xxx is a number).
* Then we create one more bike - to exceed the capacity of the station. In such case the error ``'Docking station full'`` should be raised.

```ruby
  describe '#release_bike' do
    it 'raises error when empty' do
      @bikes = []
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
```
* We want to check is an error is being raised when the `@bikes` array is empty (there are no bikes in the station.)
* For the purpose of the test, we set the `@bikes` variable to equal an empty array (`[]`).
* In such a case, we want to check if the `release_bike` method will raise error.

#### Testing the initialization method that has a default when no argument is passed.

```ruby
  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end
end
```
* First, we specify that under `subject` we understand an instance of class `DockingStation`.
  * The test is properly running without this line, as the subject is acting like self.
* We use method `let` (`let(:bike) {Bike.new}`) to memorize that when we use `bike`, we mean a new instance of class `Bike.new`.
  * From my perspective, `let(:bike) {Bike.new}` works like `bike = Bike.new` (checked it and worked :P)
* `described_class()` - If the first argument to the outermost example group is a class, the class is exposed to each example via the `described_class()` method. (def. according to relishapp.com).
  * So instead of typing `described_class::DEFAULT_CAPACITY`, we could write `DockingStation::DEFAULT_CAPACITY`. Using `described_class` is just more elegant.
* On the described class, which is `DockingStation` class, we call xxx `times` the `subject.dock(bike)` method, where xxx is the number which equals to `DEFAULT_CAPACITY`.
* Then we add one more bike (one more than the `DEFAULT_CAPACITY`) to check if an error will be raised.
<br><br>
* This test is very similar to the one checking if the station is full. The only difference is, that in this test we check if the `DEFAULT_CAPACITY` is working and we do it by using `DEFAULT_CAPACITY.times` instead of using `capacity.times`, where the `capacity` is a number provided by the user (passed as an argument in initialize method).
