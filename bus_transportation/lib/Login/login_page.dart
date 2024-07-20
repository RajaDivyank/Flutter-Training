// import 'package:bus_transportation/Utilities/utilities.dart';
// import 'package:bus_transportation/home_page.dart';
// import 'package:flutter/material.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   bool _rememberMe = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         // Prevents the page from resizing when keyboard appears
//         body: Column(
//           children: [
//             Expanded(
//               child: Stack(
//                 children: [
//                   SizedBox(
//                     height: 350,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: CustomColors.themeColors,
//                         borderRadius: BorderRadius.vertical(
//                           bottom: Radius.elliptical(
//                               MediaQuery.of(context).size.width, 100.0),
//                         ),
//                       ),
//                       child: const Center(
//                         child: Padding(
//                           padding: EdgeInsets.only(top: 80),
//                           child: Column(
//                             // mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Bus Check",
//                                 style: TextStyle(
//                                     color: CustomColors.headingColors,
//                                     fontSize: 60.0,
//                                     fontWeight: CustomFontWeights.boldFonts),
//                               ),
//                               Text(
//                                 "Login to your account",
//                                 style: TextStyle(
//                                     color: CustomColors.headingColors,
//                                     fontSize: 18.0),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 250,
//                     left: 16,
//                     right: 16,
//                     child: Card(
//                       elevation: 8,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 16,right: 16,left: 16,bottom: 10),
//                         child: Column(
//                           // mainAxisSize: MainAxisSize.min,
//                           children: [
//                             const CustomTextFormField(
//                               labelText: 'Email/Mobile No.',
//                               prefixIcon:  Icon(Icons.email),
//                             ),
//                             const SizedBox(height: 10),
//                             const CustomTextFormField(
//                               labelText: 'Password',
//                               prefixIcon: Icon(Icons.lock),
//                               obscureText: true,
//                             ),
//                             // const SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 Checkbox(
//                                   value: _rememberMe,
//                                   onChanged: (bool? value) {
//                                     setState(() {
//                                       _rememberMe = value ?? false;
//                                     });
//                                   },
//                                 ),
//                                 const Text(
//                                   'Remember Me',
//                                   style: TextStyle(color: Colors.black,fontWeight: CustomFontWeights.boldFonts),
//                                 ),
//                               ],
//                             ),
//                             // const SizedBox(height: 16),
//                             CustomButton(
//                               text: 'LOGIN',
//                               color: CustomColors.themeColors,
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => const HomePage(),), // Replace 'AnotherPage' with your target page class
//                                 );
//                                 // Handle login logic here
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               color: const Color.fromRGBO(224, 224, 224, 100),
//               padding:
//               const EdgeInsets.only(top: 1, bottom: 1, left: 10, right: 10),
//               child: Center(
//                 child: Image.asset(
//                   'assets/Logos/GNWebsoftLogo.png',
//                   // Replace with the path to your logo image
//                   height: 80.0, // Adjust the height as needed
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:bus_transportation/Utilities/utilities.dart';
import 'package:bus_transportation/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // Prevents the page from resizing when keyboard appears
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    height: 350,
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomColors.themeColors,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 100.0),
                        ),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Bus Check",
                                style: TextStyle(
                                    color: CustomColors.headingColors,
                                    fontSize: 60.0,
                                    fontWeight: CustomFontWeights.boldFonts),
                              ),
                              Text(
                                "Login to your account",
                                style: TextStyle(
                                    color: CustomColors.headingColors,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 250,
                    left: 16,
                    right: 16,
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 16, right: 16, left: 16, bottom: 10),
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            const CustomTextFormField(
                              labelText: 'Email/Mobile No.',
                              prefixIcon: Icon(Icons.email),
                            ),
                            const SizedBox(height: 10),
                            const CustomTextFormField(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              obscureText: true,
                            ),
                            // const SizedBox(height: 10),
                            Row(
                              children: [
                                Checkbox(
                                  value: _rememberMe,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _rememberMe = value ?? false;
                                    });
                                  },
                                ),
                                const Text(
                                  'Remember Me',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: CustomFontWeights.boldFonts),
                                ),
                              ],
                            ),
                            // const SizedBox(height: 16),
                            CustomButton(
                              text: 'LOGIN',
                              color: CustomColors.themeColors,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ), // Replace 'AnotherPage' with your target page class
                                );
                                // Handle login logic here
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color.fromRGBO(224, 224, 224, 100),
              padding: const EdgeInsets.only(
                  top: 1, bottom: 1, left: 10, right: 10),
              child: Center(
                child: SizedBox(
                  height: 80.0, // Fixed height
                  width: 80.0, // Fixed width (optional, for aspect ratio)
                  child: Image.asset(
                    'assets/Logos/GNWebsoftLogo.png',
                    fit: BoxFit.contain, // Maintains aspect ratio
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
