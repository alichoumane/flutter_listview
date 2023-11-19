
class Item {
  final String _name;
  final double _price;

  Item(this._name, this._price);

  // getters and setters
  String get name => _name;
  double get price => _price;

  // item description is displayed in the ListView
  @override
  String toString() {
    return 'Price: \$$_price $_name';
  }
}

// list of items, used to populate ListView
List<Item> items = [
  Item('Burger', 7),
  Item('Pizza', 10),
  Item('Salad', 6),
  Item('Fresh Juice', 5),
];
