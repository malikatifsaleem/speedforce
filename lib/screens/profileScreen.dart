import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/loginProvider.dart';
import '../customWidgets/bottomNavigationBar.dart';
import '../models/UserModel.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<User> userData;

  @override
  void initState() {
    super.initState();
    userData = LoginProvider.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      endDrawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drawer Header
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Menu',
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xFF212121),
                ),
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Profile', style: GoogleFonts.urbanist(fontSize: 18)),
              onTap: () {
                Navigator.of(context).pop();
                // Navigate to Profile Screen
                Navigator.of(context).pushReplacementNamed('/profile');
              },
            ),
            ListTile(
              title: Text('Settings', style: GoogleFonts.urbanist(fontSize: 18)),
              onTap: () {
                Navigator.of(context).pop();
                // Navigate to Settings Screen
                Navigator.of(context).pushReplacementNamed('/settings');
              },
            ),
            Spacer(),
            ListTile(
              title: Text('Logout', style: GoogleFonts.urbanist(fontSize: 18, color: Colors.red)),
              onTap: () {
                Navigator.of(context).pop(); // Close the drawer
                Provider.of<LoginProvider>(context, listen: false).logout();
                Navigator.of(context).pushReplacementNamed('/login'); // Navigate to login screen
              },
            ),
          ],
        ),
      ),
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
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Header
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: screenHeight * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'My Profile',
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                fontSize: screenWidth * 0.06,
                                height: 1.2,
                                color: Color(0xFF212121),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                            icon: Icon(Icons.menu, color: Colors.black),
                          ),
                        ],
                      ),
                    ),

                    // Profile Picture and Info
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: screenHeight * 0.03),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: screenWidth * 0.15,
                              backgroundImage: NetworkImage(data.avatar),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Text(
                              '${data.firstName} ${data.lastName}',
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                fontSize: screenWidth * 0.06,
                                height: 1.2,
                                color: Color(0xFF212121),
                              ),
                            ),
                            Text(
                              data.email,
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w600,
                                fontSize: screenWidth * 0.035,
                                height: 1.4,
                                letterSpacing: 0.2,
                                color: Color(0xFF212121),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Earnings and Ratings
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: screenHeight * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: screenWidth * 0.03),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(0xFFFFFFFF),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x0D04060F),
                                    offset: Offset(0, 4),
                                    blurRadius: 30,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Earnings',
                                      style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.w600,
                                        fontSize: screenWidth * 0.035,
                                        height: 1.4,
                                        letterSpacing: 0.2,
                                        color: Color(0xFF757575),
                                      ),
                                    ),
                                    Text(
                                      '\$${data.earnings}',
                                      style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.w700,
                                        fontSize: screenWidth * 0.05,
                                        height: 1.6,
                                        color: Color(0xFFEC3F2E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(0xFFFFFFFF),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x0D04060F),
                                    offset: Offset(0, 4),
                                    blurRadius: 30,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Ratings',
                                      style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.w600,
                                        fontSize: screenWidth * 0.035,
                                        height: 1.4,
                                        letterSpacing: 0.2,
                                        color: Color(0xFF757575),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/vectors/group_1_x2.svg', width: screenWidth * 0.04, height: screenWidth * 0.04),
                                        SizedBox(width: screenWidth * 0.02),
                                        Text(
                                          '${data.ratings}',
                                          style: GoogleFonts.urbanist(
                                            fontWeight: FontWeight.w700,
                                            fontSize: screenWidth * 0.05,
                                            height: 1.4,
                                            letterSpacing: 0.2,
                                            color: Color(0xFFEC3F2E),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // About Me
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: screenHeight * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About Me',
                            style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w700,
                              fontSize: screenWidth * 0.05,
                              height: 1.2,
                              color: Color(0xFF212121),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          RichText(
                            text: TextSpan(
                              text: data.bio,
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 0.035,
                                height: 1.4,
                                letterSpacing: 0.2,
                                color: Color(0xFF424242),
                              ),
                              children: [
                                TextSpan(
                                  text: ' view more...',
                                  style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w700,
                                    fontSize: screenWidth * 0.035,
                                    height: 1.3,
                                    letterSpacing: 0.2,
                                    color: Color(0xFFEC3F2E),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // List Section
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: screenHeight * 0.07),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.location_on, size: screenWidth * 0.06, color: Color(0xFF212121)),
                            title: Text(
                              'Business Location',
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w600,
                                fontSize: screenWidth * 0.05,
                                height: 1.4,
                                letterSpacing: 0.2,
                                color: Color(0xFF212121),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: screenWidth * 0.05, color: Color(0xFF757575)),
                          ),
                          Divider(color: Color(0xFFEEEEEE), thickness: 1),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.book, size: screenWidth * 0.06, color: Color(0xFF212121)),
                            title: Text(
                              'Bookings',
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w600,
                                fontSize: screenWidth * 0.05,
                                height: 1.4,
                                letterSpacing: 0.2,
                                color: Color(0xFF212121),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: screenWidth * 0.05, color: Color(0xFF757575)),
                          ),
                          Divider(color: Color(0xFFEEEEEE), thickness: 1),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.work, size: screenWidth * 0.06, color: Color(0xFF212121)),
                            title: Text(
                              'My Services',
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w600,
                                fontSize: screenWidth * 0.05,
                                height: 1.4,
                                letterSpacing: 0.2,
                                color: Color(0xFF212121),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: screenWidth * 0.05, color: Color(0xFF757575)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomNavBar(
                  currentIndex: 3,
                  onTap: (int index) {
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
              ),
            ],
          );
        },
      ),
    );
  }
}
