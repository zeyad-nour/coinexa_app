class CryptoCoin {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final double marketCap;
  final int marketCapRank;
  final double? priceChange24h;
  final double? priceChangePercentage24h;
  final double? high24h;
  final double? low24h;
  final double? circulatingSupply;
  final double? totalSupply;
  final double? maxSupply;
  final double? ath;
  final double? athChangePercentage;
  final DateTime? athDate;
  final double? atl;
  final double? atlChangePercentage;
  final DateTime? atlDate;
  final DateTime? lastUpdated;

  CryptoCoin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    this.priceChange24h,
    this.priceChangePercentage24h,
    this.high24h,
    this.low24h,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.lastUpdated,
  });

  factory CryptoCoin.fromJson(Map<String, dynamic> json) {
    return CryptoCoin(
      id: json['id'] ?? '',
      symbol: json['symbol'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      currentPrice: (json['current_price'] ?? 0).toDouble(),
      marketCap: (json['market_cap'] ?? 0).toDouble(),
      marketCapRank: json['market_cap_rank'] ?? 0,
      priceChange24h: (json['price_change_24h'] ?? 0)?.toDouble(),
      priceChangePercentage24h: (json['price_change_percentage_24h'] ?? 0)?.toDouble(),
      high24h: (json['high_24h'] ?? 0)?.toDouble(),
      low24h: (json['low_24h'] ?? 0)?.toDouble(),
      circulatingSupply: (json['circulating_supply'] ?? 0)?.toDouble(),
      totalSupply: (json['total_supply'] ?? 0)?.toDouble(),
      maxSupply: (json['max_supply'] ?? 0)?.toDouble(),
      ath: (json['ath'] ?? 0)?.toDouble(),
      athChangePercentage: (json['ath_change_percentage'] ?? 0)?.toDouble(),
      athDate: json['ath_date'] != null ? DateTime.parse(json['ath_date']) : null,
      atl: (json['atl'] ?? 0)?.toDouble(),
      atlChangePercentage: (json['atl_change_percentage'] ?? 0)?.toDouble(),
      atlDate: json['atl_date'] != null ? DateTime.parse(json['atl_date']) : null,
      lastUpdated: json['last_updated'] != null ? DateTime.parse(json['last_updated']) : null,
    );
  }
}
