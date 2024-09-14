import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealed_project/cubit/profil/profil_cubit.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String fullName = "Assem Ben Ahmed";
  String location = "assem@gmail.com";
  List<String> historique = ["Restaurant Marhabe", "Restaurant BestVoice"];
  List<String> localisation = [
    "91 cité belvedaire-bizerte",
    "rue batata -monplaisir"
  ];
  int selectedIndex = 0;

  List<Widget> _buildItemList(List<String> items) {
    return items
        .map((item) => ListTile(
              title: Text(item),
            ))
        .toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ProfilCubit>(context).getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<List<String>> contentLists = [historique, localisation];
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/profileBG.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'My Profile',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/profileBG.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 70,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://via.placeholder.com/150'), // Add your image URL here
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
              height:
                  60), // Adjusted to maintain the space below the CircleAvatar
          Text(
            fullName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                location,
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavigationItem(Icons.history, 'Mon Historique', 0),
                _buildBottomNavigationItem(
                    Icons.location_on, 'Mes Localisations', 1),
              ],
            ),
          ),
          Container(
            height: 180,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: _buildItemList(contentLists[selectedIndex]),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedIndex == 0) {
                      Navigator.pushNamed(context, '/historique');
                    } else if (selectedIndex == 1) {
                      Navigator.pushNamed(context, '/localisations');
                    }
                  },
                  child: Text(
                    'Voir Plus',
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selectedIndex == index
                ? Colors.green
                : Color.fromARGB(255, 83, 83, 83),
          ),
          Text(
            label,
            style: TextStyle(
              color: selectedIndex == index
                  ? Colors.green
                  : Color.fromARGB(255, 83, 83, 83),
            ),
          ),
        ],
      ),
    );
  }
}
