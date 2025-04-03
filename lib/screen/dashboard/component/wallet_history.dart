import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class UserWalletHistoryScreen extends StatefulWidget {
  const UserWalletHistoryScreen({Key? key}) : super(key: key);

  @override
  State<UserWalletHistoryScreen> createState() => _UserWalletHistoryScreenState();
}

class _UserWalletHistoryScreenState extends State<UserWalletHistoryScreen> {
  final List<Map<String, dynamic>> walletHistoryList = [
    {"message": "Payment Received", "date": "Mar 18, 2025", "amount": "+\$120.00", "isCredit": true},
    {"message": "Service Payment", "date": "Mar 16, 2025", "amount": "-\$45.00", "isCredit": false},
    {"message": "Cashback Reward", "date": "Mar 12, 2025", "amount": "+\$10.00", "isCredit": true},
    {"message": "Subscription Fee", "date": "Mar 10, 2025", "amount": "-\$15.00", "isCredit": false},
  ]; // ✅ Dummy wallet history data

  num availableBalance = 300.00; // ✅ Dummy available balance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wallet History")),
      body: Column(
        children: [
          16.height,
          // ✅ Wallet Card (Mock Balance)
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: BorderRadius.circular(12),
              backgroundColor: Colors.blueAccent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Available Balance", style: secondaryTextStyle(color: Colors.white)),
                4.height,
                Text("\$$availableBalance", style: boldTextStyle(size: 24, color: Colors.white)),
              ],
            ),
          ),
          16.height,
          Expanded(
            child: walletHistoryList.isNotEmpty
                ? ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: walletHistoryList.length,
              itemBuilder: (context, index) {
                var data = walletHistoryList[index];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(8),
                    backgroundColor: context.cardColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        data["isCredit"] ? Icons.arrow_downward : Icons.arrow_upward,
                        color: data["isCredit"] ? Colors.green : Colors.red,
                      ),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data["message"], style: boldTextStyle(size: 14)),
                          4.height,
                          Text(data["date"], style: secondaryTextStyle()),
                        ],
                      ).expand(),
                      16.width,
                      Text(
                        data["amount"],
                        style: boldTextStyle(
                          color: data["isCredit"] ? Colors.green : Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
                : Center(child: Text("No transaction history available", style: secondaryTextStyle())),
          ),
        ],
      ),
    );
  }
}
