import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../utils/common_request_button.dart';

class EditBankDetailsScreen extends StatefulWidget {
  const EditBankDetailsScreen({super.key});

  @override
  State<EditBankDetailsScreen> createState() => _EditBankDetailsScreenState();
}

class _EditBankDetailsScreenState extends State<EditBankDetailsScreen> {
  final holderCtrl = TextEditingController();
  final accNumCtrl = TextEditingController();
  final bankNumCtrl = TextEditingController();
  final branchCtrl = TextEditingController();
  final ifscCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade50,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text("Edit Bank Details", style: TextStyle(color: Colors.black)),
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Edit Payment Details",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.edit, size: 20),
                          ],
                        ),

                        SizedBox(height: 4),

                        Text(
                          "Enter your bank account details",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),

                        SizedBox(height: 16),

                        _buildEditableField("Account Holder Name", holderCtrl),
                        SizedBox(height: 20),
                        _buildEditableField("Account Number", accNumCtrl),
                        SizedBox(height: 20),
                        _buildEditableField("Bank Number", bankNumCtrl),
                        SizedBox(height: 20),
                        _buildEditableField("Branch Name", branchCtrl),
                        SizedBox(height: 20),
                        _buildEditableField("IFSC Code", ifscCtrl),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor('#004271'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => requestChangeDialog(context),
                  );
                },

                child: const Text(
                  "Submit Request",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableField(String hint, TextEditingController controller) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0x9EE0E0E0),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: HexColor('#B6B6B6'),
          width: 0.25,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        readOnly: false,        // ✔ Editable
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          hintText: hint,
          border: InputBorder.none,
        ),
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
