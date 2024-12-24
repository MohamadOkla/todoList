import 'package:flutter/material.dart';

class TabsButtons extends StatelessWidget {
  final String activeTab;
  final Function(String) onTabChanged;

  const TabsButtons({
    required this.activeTab,
    required this.onTabChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTabButton('Active', activeTab, onTabChanged),
        _buildTabButton('Completed', activeTab, onTabChanged),
        _buildTabButton('Cancelled', activeTab, onTabChanged),
      ],
    );
  }

  Widget _buildTabButton(String tab, String activeTab, Function(String) onTabChanged) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: activeTab == tab ? Colors.red : Colors.grey[300],
        foregroundColor: activeTab == tab ? Colors.white : Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onPressed: () => onTabChanged(tab),
      child: Text(tab),
    );
  }
}
