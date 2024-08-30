import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                                      data.firstName! + " " + data.lastName!,
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
                                  backgroundImage: NetworkImage(data.avatar!),
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
                                        '\$${data.earnings!.toStringAsFixed(1)}',
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
                          // Copy referral link functionality
                          final String referralLink = "https://example.com/referral";
                          Clipboard.setData(ClipboardData(text: referralLink));

                          // Optionally, show a SnackBar to confirm the link was copied
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Referral link copied to clipboard!'),
                            ),
                          );
                        },
                        icon: Icon(Icons.copy, color: Colors.white),
                        label: Text(
                          'Copy Referral Link',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Background color
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          textStyle: TextStyle(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Rectangular shape
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
                          final String referralLink = "https://example.com/referral";
                          // Share.share("Join this amazing platform using my referral link: $referralLink");
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.red,
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
                      ),

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
