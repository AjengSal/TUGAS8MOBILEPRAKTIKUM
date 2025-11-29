import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas8/theme_provider.dart';
import 'package:tugas8/user_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    final TextEditingController nameController =
        TextEditingController(text: userProvider.username);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Tema & Pengguna'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // -----------------------
            // SWITCH MODE TEMA
            // -----------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mode Gelap',
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme(value);
                  },
                ),
              ],
            ),

            const SizedBox(height: 40),

            // -----------------------
            // INPUT NAMA USER
            // -----------------------
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Pengguna',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                if (name.isNotEmpty) {
                  userProvider.saveUsername(name);
                }
              },
              child: const Text('Simpan Nama'),
            ),

            const SizedBox(height: 20),

            // -----------------------
            // MENAMPILKAN NAMA TERSIMPAN
            // -----------------------
            Text(
              "Nama tersimpan: ${userProvider.username}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
