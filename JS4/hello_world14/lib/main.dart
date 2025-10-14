import 'package:flutter/material.dart';

// Import semua widget yang sudah kamu buat di folder basic_widgets
import 'basic_widgets/text_widget.dart';
import 'basic_widgets/image_widget.dart';
import 'basic_widgets/scaffold_widget.dart';
import 'basic_widgets/datepicker_widget.dart';
import 'basic_widgets/dialog_widget.dart';
import 'basic_widgets/fab_widget.dart';
import 'basic_widgets/textfield_widget.dart'; // ✅ perbaikan di sini

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Praktikum 4 - Widget Dasar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 220, 132, 217),
        ),
        useMaterial3: true,
      ),
      home: const WidgetMenuPage(),
    );
  }
}

class WidgetMenuPage extends StatefulWidget {
  const WidgetMenuPage({super.key});

  @override
  State<WidgetMenuPage> createState() => _WidgetMenuPageState();
}

class _WidgetMenuPageState extends State<WidgetMenuPage> {
  String selectedWidget = 'Text & Image Widget';

  // fungsi untuk menampilkan widget berdasarkan pilihan dropdown
  Widget _getSelectedWidget() {
    switch (selectedWidget) {
      case 'Text & Image Widget':
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextWidget(),
            SizedBox(height: 20),
            MyImageWidget(),
          ],
        );
      case 'Scaffold Widget':
        return const ScaffoldWidget();
      case 'Date Picker Widget':
        return const DatePickerWidget();
      case 'Dialog Widget':
        return const DialogWidget();
      case 'FAB Widget':
        return const FabWidget();
      case 'TextField Widget': // ✅ tambahkan case baru
        return const TextFieldWidget();
      default:
        return const Text('Pilih Widget dari Menu');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('Demo Semua Widget'),
        centerTitle: true,
      ),
      body: Center(child: _getSelectedWidget()),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.pinkAccent),
              child: Center(
                child: Text(
                  'Daftar Widget\n(Praktikum 4)',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.text_fields),
              title: const Text('Text & Image Widget'),
              onTap: () {
                setState(() {
                  selectedWidget = 'Text & Image Widget';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.layers),
              title: const Text('Scaffold Widget'),
              onTap: () {
                setState(() {
                  selectedWidget = 'Scaffold Widget';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: const Text('Date Picker Widget'),
              onTap: () {
                setState(() {
                  selectedWidget = 'Date Picker Widget';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.warning),
              title: const Text('Dialog Widget'),
              onTap: () {
                setState(() {
                  selectedWidget = 'Dialog Widget';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_circle),
              title: const Text('FAB Widget'),
              onTap: () {
                setState(() {
                  selectedWidget = 'FAB Widget';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('TextField Widget'), // ✅ menu baru
              onTap: () {
                setState(() {
                  selectedWidget = 'TextField Widget';
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
