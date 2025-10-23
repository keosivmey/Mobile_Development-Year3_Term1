enum DeliveryMethod {
  PICKUP,
  DELIVERY,
}

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class Customer {
  final String name;
  final String email;

  Customer({required this.name, required this.email});
}

class ProductOrder {
  final Product product;
  final int quantity;

  ProductOrder({required this.product, required this.quantity});

  double get subTotalPrice => product.price * quantity;

  @override
  String toString() {
    return '${product.name} (\$${product.price.toStringAsFixed(2)} each) '
           'x $quantity = \$${subTotalPrice.toStringAsFixed(2)}';
  }
}

class Order {
  final Customer customer;
  final List<ProductOrder> productOrders;
  final DeliveryMethod deliveryMethod;
  final String? address;

  Order({
    required this.customer,
    required this.productOrders,
    required this.deliveryMethod,
    this.address,
  });

  // compute total amount
  double totalAmount() {
    double totalPrice = 0;
    for (var productOrder in productOrders) {
      totalPrice += productOrder.subTotalPrice;
    }

    // Add delivery fee if applicable
    if (deliveryMethod == DeliveryMethod.DELIVERY) {
      totalPrice += 5; // delivery fee
    }

    return totalPrice;
  }

  // print order details
  void displayOrderDetail() {
    print('================ Products Order Detail ================');
    print('Customer Name: ${customer.name}');
    print('Delivery Method: ${deliveryMethod.name}');
    if (deliveryMethod == DeliveryMethod.DELIVERY) {
      print('Address: ${address ?? "N/A"}');
    } else {
      print('Pickup at store.');
    }

    print('Ordered Products:');
    for (var po in productOrders) {
      print(po);
    }

    print('Total Price: \$${totalAmount().toStringAsFixed(2)}\n');
  }
}

void main() {
  // Products
  var laptop = Product(name: 'Laptop', price: 1000);
  var mouse = Product(name: 'Mouse', price: 7.5);
  var keyboard = Product(name: 'Keyboard', price: 45);

  // Customer 1 - Delivery
  var customer1 = Customer(name: 'Sivmey', email: 'sivmey@gmail.com');
  var order1 = Order(
    customer: customer1,
    productOrders: [
      ProductOrder(product: laptop, quantity: 1),
      ProductOrder(product: keyboard, quantity: 1),
      ProductOrder(product: mouse, quantity: 2),
    ],
    deliveryMethod: DeliveryMethod.DELIVERY,
    address: 'National road 2, Phnom Penh',
  );

  // Customer 2 - Pickup
  var customer2 = Customer(name: 'Ling', email: 'Ling@gmail.com');
  var order2 = Order(
    customer: customer2,
    productOrders: [
      ProductOrder(product: mouse, quantity: 3),
      ProductOrder(product: keyboard, quantity: 1),
    ],
    deliveryMethod: DeliveryMethod.PICKUP,
  );

    order1.displayOrderDetail();
    order2.displayOrderDetail();


}
