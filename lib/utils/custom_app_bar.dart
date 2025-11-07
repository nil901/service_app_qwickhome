// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// import '../dashboard/main_home_screen.dart';
// import 'enum.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final bool showBackButton;
//
//   const CustomAppBar({
//     Key? key,
//     required this.title,
//     this.showBackButton = true,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: preferredSize.height,
//       decoration: BoxDecoration(
//         color: HexColor('#E4F9FF'), // Light blue
//         borderRadius: const BorderRadius.vertical(
//           bottom: Radius.circular(20), // Rounded bottom edges
//         ),
//       ),
//       child: SafeArea(
//         child: Row(
//           children: [
//             if (showBackButton)
//               IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 onPressed: () {
//                   Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => MainHomeScreen(initialTab: BottomTab.schedule),
//                     ),
//                         (route) => false, // remove all previous screens
//                   );
//                 },
//
//               ),
//             Expanded(
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                   color: Colors.black87,
//                 ),
//               ),
//             ),
//             if (showBackButton)
//               SizedBox(width: 48), // To balance the back button space
//           ],
//         ),
//       ),
//     );
//   }
//   @override
//   Size get preferredSize => const Size.fromHeight(100); // Layout ke according
// }


import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../dashboard/main_home_screen.dart';
import 'enum.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final BottomTab? initialTab; // ✅ NEW PARAMETER

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.initialTab, // ✅ Pass tab from screen
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: HexColor('#E4F9FF'),
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            if (showBackButton)
              IconButton(
                icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainHomeScreen(
                            initialTab: initialTab ?? BottomTab.home,
                          ),
                        ),
                      );
                    }
                  }
              ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ),
            if (showBackButton)
              const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
