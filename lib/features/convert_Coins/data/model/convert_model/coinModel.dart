class Coin {
  final String id;
  final String name;
  final String symbol;
  final String icon;
  double usdPrice; 

  Coin({
    required this.id,
    required this.name,
    required this.symbol,
    required this.icon,
    this.usdPrice = 0.0,
  });
}
