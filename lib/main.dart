import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const PowerOffMCK());
}

class PowerOffMCK extends StatelessWidget {
  const PowerOffMCK({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Power Off Button MCK',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0A), // Premium luxury dark
      ),
      home: const CoreButtonScreen(),
    );
  }
}

class CoreButtonScreen extends StatelessWidget {
  const CoreButtonScreen({super.key});
  static const platform = MethodChannel('mck.studio/power_channel');

  Future<void> _invokePowerMenu() async {
    try {
      await platform.invokeMethod('showPowerMenu');
    } on PlatformException catch (e) {
      debugPrint("Execution Failed: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _invokePowerMenu,
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF141414),
              border: Border.all(color: Colors.redAccent.withOpacity(0.6), width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.redAccent.withOpacity(0.15),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: const Icon(
              Icons.power_settings_new_rounded,
              size: 55,
              color: Colors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}
