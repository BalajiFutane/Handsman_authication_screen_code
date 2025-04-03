import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

class WalletHistoryShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.height,
        // ✅ Wallet Card Shimmer Effect
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        20.height,
        // ✅ Shimmer Effect for Wallet History List
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: 5, // Simulate 5 loading items
            itemBuilder: (_, i) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Colors.grey[300]!),
                  ),
                  child: Row(
                    children: [
                      // ✅ Circle shimmer for transaction icon
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      ),
                      16.width,
                      // ✅ Transaction details shimmer
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height: 10, width:100, color: Colors.white),
                          8.height,
                          Container(height: 10, width: 100, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
