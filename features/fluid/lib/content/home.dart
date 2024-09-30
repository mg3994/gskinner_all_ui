import 'package:components/components.dart';
import 'package:flutter/material.dart';


class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (content, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: PlaceholderCardTall(height: 200, color: Color(0xFF99D3F7), backgroundColor: Color(0xFFC7EAFF)),
          );
        },
      ),
    );
  }
}
