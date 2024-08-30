import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/providers/loginProvider.dart';

import '../customWidgets/bottomNavigationBar.dart';
import '../models/UserModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<User> userData;

  @override
  void initState() {
    super.initState();
    userData = LoginProvider.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User>(
        future: userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.red,));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          }

          final data = snapshot.data!;

          return Container(
              color: Colors.white,
              child: Column(children: [
                // Top Section
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEC3F2E),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(15),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: -9,
                        top: -5.5,
                        child: Opacity(
                          opacity: 0.2,
                          child: SvgPicture.asset(
                            'assets/vectors/group_13_x2.svg',
                            width: 295,
                            height: 199.5,
                          ),
                        ),
                      ),

                      Positioned(
                        left: 16, // Adjust the left margin
                        right: 16, // Adjust the right margin
                        top: 127.5,

                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add padding around the ClipRRect
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomRight: Radius.circular(35),
                            ),
                            child: Container(
                              width: double.infinity, // Make the container full width minus the margins
                              height: 175,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0, 2),
                                    blurRadius: 2.5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 11.5, 26, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 27),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hello!',
                                      style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      data.firstName + " " + data.lastName,
                                      style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(data.avatar),
                                ),
                              ],
                            ),
                            SizedBox(height: 34),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'My Earnings',
                                        style: GoogleFonts.urbanist(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17,
                                          color: Color(0xFF212121),
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        '\$${data.earnings.toStringAsFixed(1)}',
                                        style: GoogleFonts.urbanist(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 30,
                                          color: Color(0xFFEC3F2E),
                                        ),
                                      ),
                                      SizedBox(height: 38),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFD6EBFF),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        padding: const EdgeInsets.fromLTRB(30, 10, 26, 10),

                                        child: Text(
                                          'Details',
                                          style: GoogleFonts.urbanist(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                            color: Color(0xFF704B8D),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/vectors/container_x2.svg',
                                  width: 176,
                                  height: 149,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.all(
                      16.0), // Add padding around the entire column
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Invite your friends and get big discounts',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Invite your other friends to our platform to get plenty of discounts waiting for you!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add your copy link functionality here
                        },
                        icon: Icon(Icons.copy,color: Colors.white,),
                        label: Text('Copy Referral Link',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Background color
                          // Text color
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          textStyle: TextStyle(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8), // Rectangular shape
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Send to',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add your send referral link functionality here
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.red, // Set the icon color to white
                        ),
                        label: Text(
                          'Send Referral Link',
                          style: TextStyle(color: Colors.red), // Set the text color to red
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Set the background color of the button
                          side: BorderSide(color: Colors.red), // Border color
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding
                          textStyle: TextStyle(fontSize: 16), // Text style
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Rectangular shape with rounded corners
                          ),
                        ),
                      )

                    ],
                  ),
                )
              ]));
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0, // Set this dynamically based on the active screen
        onTap: (int index) {
          // Handle navigation
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else if (index == 1) {
            Navigator.of(context).pushReplacementNamed('/jobs');
          } else if (index == 2) {
            Navigator.of(context).pushReplacementNamed('/earnings');
          } else if (index == 3) {
            Navigator.of(context).pushReplacementNamed('/profile');
          }
        },
      ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             // Top Section
//             Container(
//               decoration: BoxDecoration(
//                 color: Color(0xFFEC3F2E),
//                 borderRadius: BorderRadius.vertical(
//                   bottom: Radius.circular(15),
//                 ),
//               ),
//               child: Stack(
//                 children: [
//                   Positioned(
//                     left: -9,
//                     top: -5.5,
//                     child: Opacity(
//                       opacity: 0.2,
//                       child: SvgPicture.asset(
//                         'assets/vectors/group_13_x2.svg',
//                         width: 295,
//                         height: 199.5,
//                       ),
//                     ),
//                   ),
//
//                   Positioned(
//                     top: 127.5,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(40),
//                         bottomRight: Radius.circular(35),
//                       ),
//                       child: Container(
//                         width: 354,
//                         height: 175,
//                         decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.white,
//                               offset: Offset(0, 2),
//                               blurRadius: 2.5,
//                             ),
//                           ],
//                         ),
//                         child: SvgPicture.asset(
//                           'assets/vectors/rectangle_5978_x2.svg',
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(23, 11.5, 26, 0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 27),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Hello!',
//                                   style: GoogleFonts.urbanist(
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 25,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   'David Mathew',
//                                   style: GoogleFonts.urbanist(
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 24,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             CircleAvatar(
//                               radius: 25,
//                               backgroundImage: AssetImage('assets/images/image_3.jpeg'),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 34),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'My Earnings',
//                                     style: GoogleFonts.urbanist(
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 20,
//                                       color: Color(0xFF212121),
//                                     ),
//                                   ),
//                                   SizedBox(height: 2),
//                                   Text(
//                                     '\$9,545',
//                                     style: GoogleFonts.urbanist(
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 40,
//                                       color: Color(0xFFEC3F2E),
//                                     ),
//                                   ),
//                                   SizedBox(height: 38),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFFD6EBFF),
//                                       borderRadius: BorderRadius.circular(5),
//                                     ),
//                                     padding: EdgeInsets.symmetric(
//                                       vertical: 6.5,
//                                       horizontal: 12,
//                                     ),
//                                     child: Text(
//                                       'Details',
//                                       style: GoogleFonts.urbanist(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 10,
//                                         color: Color(0xFF704B8D),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SvgPicture.asset(
//                               'assets/vectors/container_x2.svg',
//                               width: 176,
//                               height: 149,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                 ),]
//               ),
//             ),
//             SizedBox(height: 24),
//             Column(children: [ Text(
//               'Invite your friends and get big discounts',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Invite your other friends to our platform to get plenty of discounts waiting for you!',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(height: 24),
//             ElevatedButton.icon(
//               onPressed: () {
//                 // Add your copy link functionality here
//               },
//               icon: Icon(Icons.copy,),
//               label: Text('Copy Referral link',style: TextStyle(color: Colors.white),),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red,
//                 // onPrimary: Colors.white,
//                 padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                 textStyle: TextStyle(fontSize: 16),
//               ),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton.icon(
//               onPressed: () {
//                 // Add your send referral link functionality here
//               },
//               icon: Icon(Icons.send),
//               label: Text('Send Referral Link'),
//               style: ElevatedButton.styleFrom(
//                 // primary: Colors.white,
//                 backgroundColor: Colors.white,
//                 side: BorderSide(color: Colors.red),
//                 padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                 textStyle: TextStyle(fontSize: 16),
//               ),
//             ),
//             ]),
//
//             // Bottom Section
//             // Expanded(
//             //   child: Container(
//             //     decoration: BoxDecoration(
//             //       color: Colors.white,
//             //       borderRadius: BorderRadius.vertical(
//             //         top: Radius.circular(16),
//             //       ),
//             //     ),
//             //     padding: EdgeInsets.symmetric(vertical: 15),
//             //     child: Column(
//             //       children: [
//             //         Row(
//             //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //           children: [
//             //             _buildBottomNavItem('Home', 'assets/vectors/vector_1_x2.svg', isActive: true),
//             //             _buildBottomNavItem('Jobs', 'assets/vectors/work_x2.svg'),
//             //             _buildBottomNavItem('Earnings', 'assets/vectors/group_6_x2.svg'),
//             //             _buildBottomNavItem('Profile', 'assets/vectors/group_22_x2.svg'),
//             //           ],
//             //         ),
//             //         SizedBox(height: 34),
//             //         ClipRRect(
//             //           borderRadius: BorderRadius.circular(100),
//             //           child: SvgPicture.asset(
//             //             'assets/vectors/vector_18_x2.svg',
//             //             width: 134,
//             //             height: 5,
//             //           ),
//             //         ),
//             //       ],
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         selectedItemColor: Colors.red[800],
//         unselectedItemColor: Colors.grey,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.work),
//             label: 'Jobs',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.attach_money),
//             label: 'Earnings',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: 0, // Set this dynamically based on the active screen
//         onTap: (int index) {
//           // Handle navigation
//           if (index == 0) {
//             Navigator.of(context).pushReplacementNamed('/home');
//           } else if (index == 1) {
//             Navigator.of(context).pushReplacementNamed('/jobs');
//           } else if (index == 2) {
//             Navigator.of(context).pushReplacementNamed('/earnings');
//           } else if (index == 3) {
//             Navigator.of(context).pushReplacementNamed('/profile');
//           }
//         },
//       ),
//     );
//   }
// }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red[800],
//         elevation: 0,
//         automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//           child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//             color: Colors.red,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Hello!\nDavid Mathew',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   padding: EdgeInsets.all(15),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         'My Earnings',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         '\$9,545',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 36,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       ElevatedButton(
//                         onPressed: () {},
//                         child: Text('Details'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Text(
//               'Invite your friends and get big discounts',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Text(
//               'Invite your other friends to our platform to get plenty of discounts waiting for you!',
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//           SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.blue,
//                   child: Icon(Icons.person, color: Colors.white),
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.green,
//                   child: Icon(Icons.person, color: Colors.white),
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.orange,
//                   child: Icon(Icons.person, color: Colors.white),
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.purple,
//                   child: Icon(Icons.person, color: Colors.white),
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.pink,
//                   child: Icon(Icons.person, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: ElevatedButton.icon(
//               onPressed: () {},
//               icon: Icon(Icons.copy),
//               label: Text('Copy Referral Link'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red,
//                 minimumSize: Size(double.infinity, 50),
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: ElevatedButton.icon(
//               onPressed: () {},
//               icon: Icon(Icons.send),
//               label: Text('Send Referral Link'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 // b: Colors.red,
//                 side: BorderSide(color: Colors.red),
//                 minimumSize: Size(double.infinity, 50),
//               ),
//             ),
//           ),
//         ],
//       )),
//
//       // Bottom Navigation Bar
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         selectedItemColor: Colors.red[800],
//         unselectedItemColor: Colors.grey,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.work),
//             label: 'Jobs',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.attach_money),
//             label: 'Earnings',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: 0, // Set this dynamically based on the active screen
//         onTap: (int index) {
//           // Handle navigation
//           if (index == 0) {
//             Navigator.of(context).pushReplacementNamed('/home');
//           } else if (index == 1) {
//             Navigator.of(context).pushReplacementNamed('/jobs');
//           } else if (index == 2) {
//             Navigator.of(context).pushReplacementNamed('/earnings');
//           } else if (index == 3) {
//             Navigator.of(context).pushReplacementNamed('/profile');
//           }
//         },
//       ),
//     );
//   }
// }
