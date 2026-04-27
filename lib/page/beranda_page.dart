import 'package:flutter_application_2/data/data_profile.dart';
import 'package:flutter_application_2/main.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:simple_alert_dialog/simple_alert_dialog.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {

  TextEditingController summaryController = TextEditingController();
  TextEditingController pengalamanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Beranda"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              // ================= FORM =================
              TextField(
                controller: summaryController,
                decoration: const InputDecoration(
                  labelText: "Summary",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: pengalamanController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: "Pengalaman (pisahkan per baris)",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // ================= SUBMIT =================
              InkWell(
                onTap: () {
                  SimpleAlertDialog.show(
                    context,
                    assetImagepath: AnimatedImage.confirm,
                    buttonsColor: Colors.green,
                    title: AlertTitleText("Apakah kamu yakin?"),
                    content: AlertContentText("Simpan data?"),
                    onConfirmButtonPressed: (ctx) {

                      // 🔥 SIMPAN DATA
                      summaryGlobal = summaryController.text;

                      pengalamanList = pengalamanController.text
                          .split('\n')
                          .where((e) => e.trim().isNotEmpty)
                          .toList();

                      CherryToast.success(
                        inheritThemeColors: true,
                        title: const Text("Berhasil menambahkan data!"),
                      ).show(context);

                      Navigator.pop(context);

                      // 🔥 PINDAH KE PROFILE
                      pageIndexNotifier.value = 1;
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // ================= DELETE =================
              InkWell(
                onTap: () {
                  SimpleAlertDialog.show(
                    context,
                    assetImagepath: AnimatedImage.warning,
                    buttonsColor: Colors.red,
                    title: AlertTitleText("Hapus data?"),
                    content: AlertContentText("Data akan dihapus"),
                    onConfirmButtonPressed: (ctx) {

                      summaryGlobal = "";
                      pengalamanList = [];

                      CherryToast.success(
                        inheritThemeColors: true,
                        title: const Text("Data dihapus!"),
                      ).show(context);

                      Navigator.pop(context);
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // ================= DIALOG =================
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      title: Text("Info"),
                      content: Text("Isi form lalu klik submit"),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Show Dialog",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}