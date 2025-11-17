import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:service_app_qwickhome/setting_screens/updatePaymentDetails.dart';

class PaymentBankingScreen extends StatefulWidget {
  const PaymentBankingScreen({super.key});

  @override
  State<PaymentBankingScreen> createState() => _PaymentBankingScreenState();
}

class _PaymentBankingScreenState extends State<PaymentBankingScreen> {
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
        title: Text("Payment & Banking", style: TextStyle(color: Colors.black)),
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
                    height: 107,
                    // width: double.infinity,
                    padding: EdgeInsets.only(left: 20, right: 12, top: 8, bottom: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFE6F7FF),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: HexColor('#004271')),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center, // ✅ center align
                          children: [
                            Image.asset('assets/images/alert.png', height: 20, width: 18),
                            SizedBox(width: 10),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Image.asset('assets/images/lock.png', height: 15, width: 12),
                            ),
                            SizedBox(width: 6),

                            Text(
                              "Information Protected",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14),
                        Text(
                          "For security reasons, personal information cannot be edited directly. To update your information, "
                              "please request changes through our admin team.",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.all(16),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Choose Payment Details",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.lock_outline, size: 20),
                          ],
                        ),

                        SizedBox(height: 4),

                        // Small subtitle text
                        Text(
                          "Bank Account Details",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),

                        SizedBox(height: 16),

                        _buildField("Account Holder Name", holderCtrl),
                        SizedBox(height: 20),
                        _buildField("Account Number", accNumCtrl),
                        SizedBox(height: 20),
                        _buildField("Bank Number", bankNumCtrl),
                        SizedBox(height: 20),
                        _buildField("Branch Name", branchCtrl),
                        SizedBox(height: 20),
                        _buildField("IFSC Code", ifscCtrl),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditBankDetailsScreen()));
                },

                child: const Text(
                  "Request Changes",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold ,
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

  Widget _buildField(String hint, TextEditingController controller) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0x9EE0E0E0), // #E0E0E09E
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
        readOnly: true,
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
