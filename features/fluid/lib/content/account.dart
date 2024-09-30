import 'package:components/components.dart';
import 'package:flutter/material.dart';


class AccountContent extends StatelessWidget {
  const AccountContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (content, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: PlaceholderCardShort(color: Color(0xFF99D3F7), backgroundColor: Color(0xFFC7EAFF)),
          );
        },
      ),
    );
  }
}
