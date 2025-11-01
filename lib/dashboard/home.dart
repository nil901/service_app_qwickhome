import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:service_app_qwickhome/utils/comman_app_bar.dart';
import '../colors/colors.dart';

enum RequestStatus { all, inProgress, completed }

class Request {
  final String name;
  final String service;
  final String address;
  final String time;
  final String price;
  final RequestStatus status;

  Request({
    required this.name,
    required this.service,
    required this.address,
    required this.time,
    required this.price,
    required this.status,
  });
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RequestStatus currentStatus = RequestStatus.all;

  // Sample data
  final List<Request> requests = [
    Request(
      name: "Amit Deshmukh",
      service: "Pest Control",
      address: "College Road, Nashik",
      time: "02 Oct 2025, 11:00 AM",
      price: "AED 499",
      status: RequestStatus.completed,
    ),
    Request(
      name: "Risha Bora",
      service: "Deep Cleaning - Kitchen",
      address: "Gangapur Road, Nashik",
      time: "01 Oct 2025, 10:00 AM",
      price: "AED 1,199",
      status: RequestStatus.completed,
    ),
    Request(
      name: "Neha Sharma",
      service: "Home Cleaning",
      address: "Govind Nagar, Nashik",
      time: "02 Oct 2025, 11:00 AM",
      price: "AED 999",
      status: RequestStatus.inProgress,
    ),
    Request(
      name: "Rahul Verma",
      service: "Laundry - Clothes & Shoes",
      address: "Govind Nagar, Nashik",
      time: "03 Oct 2025, 10:00 AM",
      price: "AED 499",
      status: RequestStatus.all,
    ),
    Request(
      name: "Sanya Kapoor",
      service: "Ironing & Wardrobe Assistance",
      address: "Gangapur Road, Nashik",
      time: "04 Oct 2025, 3:00 PM",
      price: "AED 999",
      status: RequestStatus.all,
    ),
  ];

  List<Request> get filteredRequests {
    switch (currentStatus) {
      case RequestStatus.all:
        return requests;
      case RequestStatus.inProgress:
        return requests.where((r) => r.status == RequestStatus.inProgress).toList();
      case RequestStatus.completed:
        return requests.where((r) => r.status == RequestStatus.completed).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: CommanAppBar(),
      ),
      backgroundColor: kwhite,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                FilterButton(
                  text: 'All Requests',
                  selected: currentStatus == RequestStatus.all,
                  onTap: () => setState(() => currentStatus = RequestStatus.all),
                ),
                const SizedBox(width: 8),
                FilterButton(
                  text: 'In Progress',
                  selected: currentStatus == RequestStatus.inProgress,
                  onTap: () => setState(() => currentStatus = RequestStatus.inProgress),
                ),
                const SizedBox(width: 8),
                FilterButton(
                  text: 'Completed',
                  selected: currentStatus == RequestStatus.completed,
                  onTap: () => setState(() => currentStatus = RequestStatus.completed),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRequests.length,
              itemBuilder: (context, index) {
                final req = filteredRequests[index];
                return RequestCard(request: req, currentStatus: currentStatus);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const FilterButton({required this.text, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 35,
          decoration: BoxDecoration(
            color: selected ? HexColor('#004271') : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: HexColor('#004271'), width: 1),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: selected ? Colors.white : HexColor('#004271'),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  final Request request;
  final RequestStatus currentStatus;

  const RequestCard({required this.request, required this.currentStatus});

  @override
  Widget build(BuildContext context) {
    bool showStatus = currentStatus != RequestStatus.all;

    // Define styles for status buttons
    Color backgroundColor;
    Color textColor;
    String statusText;

    switch (request.status) {
      case RequestStatus.completed:
        backgroundColor = HexColor('#E4F9FF');
        textColor = HexColor('#15B700');
        statusText = 'Completed';
        break;
      case RequestStatus.inProgress:
        backgroundColor = HexColor('#E4F9FF');
        textColor = HexColor('#004271');
        statusText = 'In Progress';
        break;
      default:
        backgroundColor = Colors.transparent;
        textColor = Colors.black;
        statusText = '';
    }

    return Container(
      width: 350,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: HexColor('#FCFCFC'),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: HexColor('#DBDBDB'), width: 0.6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile + Name + (Status)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/user_img.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  request.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              if (showStatus && statusText.isNotEmpty)
                Container(
                  width: 107,
                  height: 30,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  //  border: Border.all(color: HexColor('#004271'), width: 1),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    statusText,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 15),

          // Service title and Date/Time labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Service Requested',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: HexColor('#353535'),
                ),
              ),
              Text(
                'Date & Time of Request',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: HexColor('#353535'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Service & Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  request.service,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: HexColor('#353535'),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                request.time,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: HexColor('#353535'),
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          const SizedBox(height: 13),
          const Divider(color: Colors.grey, height: 1),
          const SizedBox(height: 8),

          // Address + Price
          Row(
            children: [
              Icon(Icons.location_on, size: 18, color: HexColor('#004271')),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  request.address,
                  style: TextStyle(fontSize: 12, color: HexColor('#353535')),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.currency_exchange, size: 16, color: Colors.blueGrey),
              const SizedBox(width: 4),
              Text(
                request.price,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: HexColor('#353535'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // View Details
          GestureDetector(
            onTap: () {},
            child: Text(
              "View Details about the Service",
              style: TextStyle(
                color: HexColor('#004271'),
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),

          const SizedBox(height: 14),

          // ✅ Accept/Decline buttons only for All Requests
          if (currentStatus == RequestStatus.all)
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor('#EAF5FA'),
                      foregroundColor: HexColor('#004271'),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      "Decline",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor('#004271'),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      "Accept",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
