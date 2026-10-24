
//Q1

double calculateTotal(double a, double b, double c) {
  return a + b + c;
}
double calculateAverage(double total) {
  return total / 3;
}
String getResult(double average) {
  if (average >= 50) {
    return "Pass";
  } else {
    return "Fail";
  }
}
void main() {

  double mark1 = 45.0;
  double mark2 = 60.0;
  double mark3 = 75.0;
  double total = calculateTotal(mark1, mark2, mark3);
  double average = calculateAverage(total);
  String result = getResult(average);

  print("Task 1 Results:");
  print("Total: $total");
  print("Average: $average");
  print("Result: $result");
}



//Q2

class Student {
  String name;
  int age;
  double grade;

  Student(this.name, this.age, this.grade);
  void displayInfo() {
    print("Name: $name, Age: $age, Grade: $grade");
  }
  bool isPassed() {
    return grade >= 50;
  }
}
Student findTopStudent(List<Student> students) {
  Student topStudent = students[0];
  for (var student in students) {
    if (student.grade > topStudent.grade) {
      topStudent = student;
    }
  }
  return topStudent;
}

void main() {
  // إنشاء 3 كائنات للطلاب
  Student s1 = Student("Ahmed", 20, 48.5);
  Student s2 = Student("Fatima", 21, 92.0);
  Student s3 = Student("Omar", 19, 78.5);
  List<Student> students = [s1, s2, s3];

  print("Task 2 Results:");
  for (var s in students) {
    s.displayInfo();
    print("Passed: ${s.isPassed()}\n");
  }
  Student top = findTopStudent(students);
  print("Top Student: ${top.name} with grade ${top.grade}\n");
}


//Q3

class BankAccount {
  String accountHolder;
  double _balance; 
  BankAccount(this.accountHolder, double initialBalance) : _balance = 0.0 {
    balance = initialBalance;
  }
  double get balance => _balance;
  set balance(double value) {
    if (value >= 0) {
      _balance = value;
    } else {
      print("Error: Balance cannot be negative!");
    }
  }
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited: $amount. New balance: $_balance");
    } else {
      print("Error: Deposit amount must be positive.");
    }
  }
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Withdrawn: $amount. Remaining balance: $_balance");
    } else {
      print("Error: Insufficient funds or invalid amount!");
    }
  }
}

void main() {
  print("Task 3 Results:");
  BankAccount account = BankAccount("Ali", 1000.0);
  account.deposit(500.0);
  account.withdraw(200.0);
  account.withdraw(2000.0); 
  print("Final Balance: ${account.balance}\n");
}


//Q4

class Product {
  String name;
  int id;
  double _price;
  int _quantity;
  Product(this.name, this.id, double price, int quantity)
      : _price = 0.0,
        _quantity = 0 {
    _price = price >= 0 ? price : 0.0;
    _quantity = quantity >= 0 ? quantity : 0;
  }
  double get price => _price;
  set price(double value) {
    if (value >= 0) {
      _price = value;
    } else {
      print("Error: Price cannot be negative.");
    }
  }
  int get quantity => _quantity;
  set quantity(int value) {
    if (value >= 0) {
      _quantity = value;
    } else {
      print("Error: Quantity cannot be negative.");
    }
  }
  void updateStock(int amount) {
    if (_quantity + amount >= 0) {
      _quantity += amount;
      print("Stock updated for $name. Current quantity: $_quantity");
    } else {
      print("Error: Stock cannot become negative!");
    }
  }
  double calculateTotalValue() {
    return _price * _quantity;
  }
}
Product? findProduct(List<Product> products, int id) {
  for (var product in products) {
    if (product.id == id) {
      return product;
    }
  }
  return null;
}
double calculateAllProductsValue(List<Product> products) {
  double totalValue = 0;
  for (var product in products) {
    totalValue += product.calculateTotalValue();
  }
  return totalValue;
}

void main() {
  print("Task 4 Results:");
  Product p1 = Product("Laptop", 101, 1200.0, 5);
  Product p2 = Product("Mouse", 102, 25.0, 50);
  Product p3 = Product("Keyboard", 103, 75.0, 20);

  List<Product> storeProducts = [p1, p2, p3];
  p1.updateStock(-2); 
  Product? found = findProduct(storeProducts, 102);
  if (found != null) {
    print("Found Product: ${found.name}, Price: ${found.price}");
  }
  double totalStoreValue = calculateAllProductsValue(storeProducts);
  print("Total Inventory Value: $totalStoreValue");
}