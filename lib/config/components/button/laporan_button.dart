import 'package:flutter/material.dart';
import 'package:mobile_apps_app/config/routes/routes_name.dart';

class LaporanButton extends StatelessWidget {
  final double width;
  final double height;
  const LaporanButton({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.historyScreen);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: const Icon(Icons.history, size: 40),
      ),
    );
  }
}
