import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../dashboard/notification_screen.dart';

class CommanAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommanAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // responsive width
      height: preferredSize.height,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: HexColor('#E4F9FF'),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 3),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Location + Name Column
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // center content
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const Icon(Icons.location_on, color: Colors.black, size: 30),
                Image.asset('assets/images/user_img.png', height: 35, width: 45,),
                const SizedBox(width: 4),
                Flexible( // Flexible instead of Expanded to avoid cutting text
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Patil Classics",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              "Tidake colony, Durwankur Lawns, Nashik ....",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade700,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            size: 16,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Notification Icon Only (Cart removed)
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130);
}
