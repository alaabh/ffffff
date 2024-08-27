import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 4590), () {
      Navigator.pushReplacement(
        context,
        _createRoute(FirstPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.gif',
          height: 130,
          width: 130,
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bienvenue Cher Utilisateur',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/User.gif',
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildCarouselIndicator(active: true),
                      SizedBox(width: 8),
                      _buildCarouselIndicator(active: false),
                      SizedBox(width: 8),
                      _buildCarouselIndicator(active: false),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Text
            Text(
              'Commandez vos plats préférés\n'
              'directement depuis votre téléphone.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            SizedBox(height: 20),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // NEXT button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      _createRoute(SecondPage()),
                    );
                  },
                  child: Text('NEXT =>'),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 10),

            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Signup');
              },
              child: Text(
                'Skip this page',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselIndicator({required bool active}) {
    return Container(
      width: active ? 12 : 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Colors.orange : Colors.grey,
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Bienvenue Cher Utilisateur',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Image.asset(
                    'assets/Location.gif',
                    width: 190,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildCarouselIndicator(active: false),
                      SizedBox(width: 8),
                      _buildCarouselIndicator(active: true),
                      SizedBox(width: 8),
                      _buildCarouselIndicator(active: false),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Text
            Text(
              'Commandez vos plats préférés\n'
              'directement depuis votre téléphone.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              // Buttons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // BACK button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('<= BACK'),
                  ),
                  // NEXT button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        _createRoute(ThirdPage()),
                      );
                    },
                    child: Text('NEXT =>'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Signup');
              },
              child: Text(
                'Skip this page',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselIndicator({required bool active}) {
    return Container(
      width: active ? 12 : 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Colors.orange : Colors.grey,
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Bienvenue Cher Utilisateur',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Image.asset(
                    'assets/Driver.gif',
                    height: 250,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildCarouselIndicator(active: false),
                      SizedBox(width: 8),
                      _buildCarouselIndicator(active: false),
                      SizedBox(width: 8),
                      _buildCarouselIndicator(active: true),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Text
            Text(
              'Commandez vos plats préférés\n'
              'directement depuis votre téléphone.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            SizedBox(height: 20),
            // Buttons
            Container(
              margin: EdgeInsets.only(bottom: 22, left: 20, right: 20),
              // Buttons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // BACK button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('<= BACK'),
                  ),
                  // NEXT button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/Signup');
                    },
                    child: Text('NEXT =>'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Signup');
              },
              child: Text(
                'Skip this page',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselIndicator({required bool active}) {
    return Container(
      width: active ? 12 : 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Colors.orange : Colors.grey,
      ),
    );
  }
}

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  int selectedButtonIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Etes-vous?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedButtonIndex = 0;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedButtonIndex == 0
                      ? Colors.orange
                      : Theme.of(context).colorScheme.onError,
                  minimumSize: Size(300, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Restaurant',
                  style: TextStyle(
                    color:
                        selectedButtonIndex == 0 ? Colors.white : Colors.orange,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedButtonIndex = 1;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedButtonIndex == 1
                      ? Colors.orange
                      : Theme.of(context).colorScheme.onError,
                  minimumSize: Size(300, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Client',
                  style: TextStyle(
                    color:
                        selectedButtonIndex == 1 ? Colors.white : Colors.orange,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedButtonIndex = 2;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedButtonIndex == 2
                      ? Colors.orange
                      : Theme.of(context).colorScheme.onError,
                  minimumSize: Size(300, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Livreur',
                  style: TextStyle(
                    color:
                        selectedButtonIndex == 2 ? Colors.white : Colors.orange,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                if (selectedButtonIndex == 0) {
                  Navigator.pushNamed(context, '/homePage_restaurant');
                } else if (selectedButtonIndex == 1) {
                  Navigator.pushNamed(context, '/homePage_client');
                } else if (selectedButtonIndex == 2) {
                  Navigator.pushNamed(context, '/homePage_livreur');
                }
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
