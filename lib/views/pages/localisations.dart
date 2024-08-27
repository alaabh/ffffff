import 'package:flutter/material.dart';

class LocalisationsPage extends StatefulWidget {
  @override
  _LocalisationsPageState createState() => _LocalisationsPageState();
}

class _LocalisationsPageState extends State<LocalisationsPage> {
  final List<String> locations = [
    '7000 cite belvedaire, bizerte',
    '2000 cte devaoptia, tunis',
  ];

  final String imageUrl = 'https://fr.surf-forecast.com/locationmaps/La-Marsa.10.gif';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Localisations'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _showAddLocationDialog(context);
              },
              child: Text(
                'Ajouter une nouvelle localisation',
                style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showImagePopup(context, locations[index]);
                  },
                  child: ChartItem(
                    location: locations[index],
                    onDelete: () {
                      setState(() {
                        locations.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddLocationDialog(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Ajouter une nouvelle localisation'),
        content: TextField(
          controller: _controller,
          decoration: InputDecoration(hintText: 'Nom de la localisation'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                locations.add(_controller.text);
              });
              Navigator.of(context).pop();
            },
            child: Text('Ajouter'),
          ),
        ],
      ),
    );
  }

  void _showImagePopup(BuildContext context, String location) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(imageUrl),
                SizedBox(height: 8.0),
                Text(
                  location,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Fermer'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ChartItem extends StatelessWidget {
  final String location;
  final VoidCallback onDelete;

  const ChartItem({Key? key, required this.location, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.green),
                SizedBox(width: 8.0),
                Text(
                  _truncateLocation(location),
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.green),
                ),
              ],
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'edit') {
                  // Implement edit functionality if needed
                } else if (value == 'delete') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('Êtes-vous sûr de vouloir supprimer cette localisation ?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Annuler'),
                        ),
                        TextButton(
                          onPressed: () {
                            onDelete();
                            Navigator.of(context).pop();
                          },
                          child: Text('Oui'),
                        ),
                      ],
                    ),
                  );
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'edit',
                  child: ListTile(
                    leading: Icon(Icons.edit, color: Theme.of(context).colorScheme.secondary),
                    title: Text('Modifier', style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'delete',
                  child: ListTile(
                    leading: Icon(Icons.delete, color: Theme.of(context).colorScheme.secondary),
                    title: Text('Supprimer', style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                  ),
                ),
              ],
              icon: Icon(Icons.more_vert, color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
      ),
    );
  }

  String _truncateLocation(String location) {
    if (location.length <= 12) {
      return location;
    } else {
      return location.substring(0, 12) + '...';
    }
  }
}
