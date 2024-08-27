import 'package:flutter/material.dart';
import '../views/pages/favoris_page.dart';
import '../views/pages/historique_page.dart';
import '../views/pages/localisations.dart';
import '../views/pages/parametres.dart';
import '../../views/login.dart';

class SidebarPopup extends StatelessWidget {
  

  SidebarPopup();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 180,
        height: MediaQuery.of(context).size.height,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                color: Colors.green,
                height: 220, 
                child: DrawerHeader(
                  padding: EdgeInsets.all(0), // Remove default padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                                    SizedBox(height: 60,),
                      CircleAvatar(
                        radius: 25, 
                        backgroundImage: NetworkImage(
                            'https://www.iconpacks.net/icons/2/free-user-icon-3296-thumb.png'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Assem Ben Ahmed',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ), 
                      Text(
                        'assem@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100,),
              buildDrawerItem(context, Icons.favorite, 'Mes Favories', FavorisPage()),
              buildDrawerItem(context, Icons.history, 'Historique', HistoryPage()),
              buildDrawerItem(context, Icons.location_on, 'Localisations', LocalisationsPage()),
              buildDrawerItem(context, Icons.settings, 'Paramètres', ParametresPage()),
              buildDrawerItem(context, Icons.exit_to_app, 'Deconnecter', Login()),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawerItem(BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30, 
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
