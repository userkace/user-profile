import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'User Profile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1b1110),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1b1110),
        title: Text(
          widget.title,
          style: const TextStyle(color: Color(0xFFf4e9e7)),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, top: 30.0), // Adjust padding value as needed
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/padilla.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                'Kervin Clyde S. Padilla',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color:
                          const Color(0xFFebe0de), // Set the desired color here
                    ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () async {
                  final Uri url = Uri.parse('https://github.com/userkace');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(const Color(0xFF5c3f41)),
                ),
                child: Text(
                  '@userkace',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFFfed9d9),
                      ),
                ),
              ),
              const SizedBox(height: 8), // Add some spacing between the buttons
              const CircularContactButtons(), // Your circular buttons widget
              const SizedBox(
                  height: 16), // Add some spacing between the buttons
              const ContactInfoCard(
                title: 'Contact info',
                phoneNumber: '+639602024511',
                email: 'user@kace.dev',
                birthday: 'April 27, 2004',
                phoneNumberSubtext: 'SMART',
                emailSubtext: 'Personal',
                birthdaySubtext: '20 years old',
                horizontalPadding: 24.0,
                iconColor: Color(0xFFd8c1c2),
                textColor: Color(0xFFebe0de),
                cardPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                cardMargin: EdgeInsets.all(16.0),
                cardBackgroundColor: Color(0xFF231918),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Uri url = Uri.parse('https://github.com/userkace/user-profile');
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        },
        tooltip: 'Open Github',
        splashColor: const Color(0xFF6a212a),
        backgroundColor: const Color(0xFF5c3f41),
        elevation: 8.0,
        child: Image.asset('assets/github.png', height: 36),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CircularContactButtons extends StatelessWidget {
  final String phoneNumber = '+639602024511';
  final String emailAddress = 'user@kace.dev';

  const CircularContactButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _buildCircularButton(
                icon: Icons.phone_outlined,
                onPressed: () async {
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: phoneNumber,
                  );
                  await launchUrl(launchUri);
                },
              ),
            ),
            const SizedBox(height: 4),
            const Text('Call',
                style: TextStyle(
                    color: Color(0xFFfed9da))), // Text below the button
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _buildCircularButton(
                icon: Icons.message_outlined,
                onPressed: () async {
                  final Uri launchUri = Uri(
                    scheme: 'sms',
                    path: phoneNumber,
                  );
                  await launchUrl(launchUri);
                },
              ),
            ),
            const SizedBox(height: 4),
            const Text('Text',
                style: TextStyle(
                    color: Color(0xFFfed9da))), // Text below the button
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _buildCircularButton(
                icon: Icons.mail_outlined, // Assuming you're using Font Awesome
                onPressed: () async {
                  final Uri launchUri = Uri(
                    scheme: 'mailto',
                    path: emailAddress,
                  );
                  await launchUrl(launchUri);
                },
              ),
            ),
            const SizedBox(height: 4),
            const Text('Email',
                style: TextStyle(
                    color: Color(0xFFfed9da))), // Text below the button
          ],
        )
      ],
    );
  }

  Widget _buildCircularButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        backgroundColor: const Color(0xFF5c3f41),
        // Apply border to the button itself
      ),
      child: Icon(
        icon,
        color: const Color(0xFFfed9d9),
      ),
    );
  }
}

class ContactInfoCard extends StatelessWidget {
  final String title;
  final String phoneNumber;
  final String phoneNumberSubtext;
  final String email;
  final String emailSubtext;
  final String birthday;
  final String birthdaySubtext;
  final double horizontalPadding;
  final EdgeInsets cardPadding;
  final EdgeInsets cardMargin;
  final Color iconColor;
  final Color textColor;
  final Color cardBackgroundColor;

  const ContactInfoCard({
    super.key,
    required this.title,
    required this.phoneNumber,
    required this.phoneNumberSubtext,
    required this.email,
    required this.emailSubtext,
    required this.birthday,
    required this.birthdaySubtext,
    this.horizontalPadding = 16.0,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
    this.cardPadding = const EdgeInsets.all(16.0),
    this.cardMargin = const EdgeInsets.all(0.0),
    this.cardBackgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // AddedContainer for margin
      margin: cardMargin, // Apply custom card margin
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: cardBackgroundColor, // Set card background color
        child: Padding(
          padding: cardPadding, // Use custom card padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8.0),
              _buildInfoRow(
                  Icons.phone_outlined, phoneNumber, phoneNumberSubtext),
              _buildInfoRow(Icons.email_outlined, email, emailSubtext),
              _buildInfoRow(Icons.cake_outlined, birthday, birthdaySubtext),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String info, String subtext) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(info, style: TextStyle(color: textColor)),
              if (subtext.isNotEmpty)
                Text(
                  subtext,
                  style: TextStyle(
                    color: textColor.withOpacity(0.7),
                    fontSize: 12.0,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
