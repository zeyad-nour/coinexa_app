// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';

class CoinsModel extends Equatable {
  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final double? currentPrice;
  final double? marketCap;
  final double? marketCapRank;
  final double? fullyDilutedValuation;
  final double? totalVolume;
  final double? high24h;
  final double? low24h;
  final double? priceChange24h;
  final double? priceChangePercentage24h;
  final double? marketCapChange24h;
  final double? marketCapChangePercentage24h;
  final double? circulatingSupply;
  final double? totalSupply;
  final double? maxSupply;
  final double? ath;
  final double? athChangePercentage;
  final DateTime? athDate;
  final double? atl;
  final double? atlChangePercentage;
  final DateTime? atlDate;
  final dynamic roi;
  final DateTime? lastUpdated;

  const CoinsModel({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24h,
    this.low24h,
    this.priceChange24h,
    this.priceChangePercentage24h,
    this.marketCapChange24h,
    this.marketCapChangePercentage24h,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
  });

  factory CoinsModel.fromJson(Map<String, dynamic> json) => CoinsModel(
        id: json['id'] as String?,
        symbol: json['symbol'] as String?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        currentPrice: (json['current_price'] as num?)?.toDouble(),
        marketCap: (json['market_cap'] as num?)?.toDouble(),
        marketCapRank: (json['market_cap_rank'] as num?)?.toDouble(),
        fullyDilutedValuation:
            (json['fully_diluted_valuation'] as num?)?.toDouble(),
        totalVolume: (json['total_volume'] as num?)?.toDouble(),
        high24h: (json['high_24h'] as num?)?.toDouble(),
        low24h: (json['low_24h'] as num?)?.toDouble(),
        priceChange24h: (json['price_change_24h'] as num?)?.toDouble(),
        priceChangePercentage24h:
            (json['price_change_percentage_24h'] as num?)?.toDouble(),
        marketCapChange24h:
            (json['market_cap_change_24h'] as num?)?.toDouble(),
        marketCapChangePercentage24h:
            (json['market_cap_change_percentage_24h'] as num?)?.toDouble(),
        circulatingSupply: (json['circulating_supply'] as num?)?.toDouble(),
        totalSupply: (json['total_supply'] as num?)?.toDouble(),
        maxSupply: (json['max_supply'] as num?)?.toDouble(),
        ath: (json['ath'] as num?)?.toDouble(),
        athChangePercentage:
            (json['ath_change_percentage'] as num?)?.toDouble(),
        athDate: json['ath_date'] == null
            ? null
            : DateTime.parse(json['ath_date'] as String),
        atl: (json['atl'] as num?)?.toDouble(),
        atlChangePercentage:
            (json['atl_change_percentage'] as num?)?.toDouble(),
        atlDate: json['atl_date'] == null
            ? null
            : DateTime.parse(json['atl_date'] as String),
        roi: json['roi'] as dynamic,
        lastUpdated: json['last_updated'] == null
            ? null
            : DateTime.parse(json['last_updated'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'symbol': symbol,
        'name': name,
        'image': image,
        'current_price': currentPrice,
        'market_cap': marketCap,
        'market_cap_rank': marketCapRank,
        'fully_diluted_valuation': fullyDilutedValuation,
        'total_volume': totalVolume,
        'high_24h': high24h,
        'low_24h': low24h,
        'price_change_24h': priceChange24h,
        'price_change_percentage_24h': priceChangePercentage24h,
        'market_cap_change_24h': marketCapChange24h,
        'market_cap_change_percentage_24h': marketCapChangePercentage24h,
        'circulating_supply': circulatingSupply,
        'total_supply': totalSupply,
        'max_supply': maxSupply,
        'ath': ath,
        'ath_change_percentage': athChangePercentage,
        'ath_date': athDate?.toIso8601String(),
        'atl': atl,
        'atl_change_percentage': atlChangePercentage,
        'atl_date': atlDate?.toIso8601String(),
        'roi': roi,
        'last_updated': lastUpdated?.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        id,
        symbol,
        name,
        image,
        currentPrice,
        marketCap,
        marketCapRank,
        fullyDilutedValuation,
        totalVolume,
        high24h,
        low24h,
        priceChange24h,
        priceChangePercentage24h,
        marketCapChange24h,
        marketCapChangePercentage24h,
        circulatingSupply,
        totalSupply,
        maxSupply,
        ath,
        athChangePercentage,
        athDate,
        atl,
        atlChangePercentage,
        atlDate,
        roi,
        lastUpdated,
      ];
}
