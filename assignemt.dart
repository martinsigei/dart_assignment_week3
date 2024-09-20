void main() {
  // Encapsulation Example
  print("Encapsulation Example:");
  Customer customer = Customer('Martin', 12345);
  customer.displayCustomerInfo();
  // Trying to directly access private data (this will result in an error if uncommented)
  // print(customer._customerID); // Error: _customerID is private

  // Inheritance Example
  print("\nInheritance Example:");
  RegularCustomer regularCustomer = RegularCustomer('Alice', 56789);
  regularCustomer.displayCustomerInfo();
  regularCustomer.makePurchase(200);

  VIPCustomer vipCustomer = VIPCustomer('Bob', 98765);
  vipCustomer.displayCustomerInfo();
  vipCustomer.makePurchase(200);

  // Polymorphism Example
  print("\nPolymorphism Example:");
  RegularCustomer anotherRegularCustomer = RegularCustomer('Charlie', 54321);
  anotherRegularCustomer.makePurchase(100);

  VIPCustomer anotherVIPCustomer = VIPCustomer('Diana', 11223);
  anotherVIPCustomer.makePurchase(100);

  // Abstraction Example
  print("\nAbstraction Example:");
  ElectricCar tesla = Tesla('Tesla', 'Model S');
  tesla.displayCarDetails();
  tesla.accelerate();

  ElectricCar nissanLeaf = NissanLeaf('Nissan', 'Leaf');
  nissanLeaf.displayCarDetails();
  nissanLeaf.accelerate();
}

///////////////////////////////
// Encapsulation
///////////////////////////////
class Customer {
  String _name;
  int _customerID; // Private variable

  // Constructor to initialize the customer
  Customer(this._name, this._customerID);

  // Public method to display customer information
  void displayCustomerInfo() {
    print("Customer Name: $_name, Customer ID: $_customerID");
  }

  // Getter for the private _customerID
  int get customerID => _customerID;

  // Setter to control modification of the _customerID
  set customerID(int newID) {
    if (newID > 0) {
      _customerID = newID;
    }
  }
}

///////////////////////////////
// Inheritance and Polymorphism
///////////////////////////////

// Superclass
class CustomerType {
  String _name;
  int _customerID;

  CustomerType(this._name, this._customerID);

  // A method to display the customer's name and ID
  void displayCustomerInfo() {
    print("Customer: $_name, ID: $_customerID");
  }

  // Method to be overridden (demonstrates polymorphism)
  void makePurchase(double amount) {
    print("$_name made a purchase of \$${amount}");
  }
}

// Subclass: Regular Customer
class RegularCustomer extends CustomerType {
  RegularCustomer(String name, int customerID) : super(name, customerID);

  // Overriding the makePurchase method (polymorphism)
  @override
  void makePurchase(double amount) {
    print("Regular customer $_name made a purchase of \$${amount} with no discount.");
  }
}

// Subclass: VIP Customer
class VIPCustomer extends CustomerType {
  VIPCustomer(String name, int customerID) : super(name, customerID);

  // Overriding the makePurchase method with a unique implementation for VIP customers
  @override
  void makePurchase(double amount) {
    double discount = amount * 0.10; // VIP customers get a 10% discount
    double finalAmount = amount - discount;
    print("VIP customer $_name made a purchase of \$${amount}, after discount: \$${finalAmount}");
  }
}

///////////////////////////////
// Abstraction
///////////////////////////////

// Abstract class
abstract class ElectricCar {
  String make;
  String model;

  ElectricCar(this.make, this.model);

  // Abstract method: must be implemented by subclasses
  void accelerate();

  // Regular method
  void displayCarDetails() {
    print("Electric Car: $make $model");
  }
}

// Subclass of ElectricCar
class Tesla extends ElectricCar {
  Tesla(String make, String model) : super(make, model);

  // Implementing the abstract method
  @override
  void accelerate() {
    print("Tesla $model accelerates quickly to 60 mph in 3.1 seconds!");
  }
}

// Another subclass of ElectricCar
class NissanLeaf extends ElectricCar {
  NissanLeaf(String make, String model) : super(make, model);

  // Implementing the abstract method
  @override
  void accelerate() {
    print("Nissan Leaf accelerates to 60 mph in 8.4 seconds.");
  }
}
