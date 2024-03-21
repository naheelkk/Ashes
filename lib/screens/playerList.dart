import 'package:ashes/common/bottomNavBar.dart';
import 'package:ashes/services/db_services.dart';
import 'package:flutter/material.dart';
class PlayerList extends StatefulWidget {
  const PlayerList({super.key});

  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  List players = [];
  Future<void> loadPlayers() async {
    List fetchedPlayers =
    await PlayersService.getPlayers();
    setState(() {
      players = fetchedPlayers;
    });
  }
  @override
  void initState(){
    super.initState();
    loadPlayers();
  }
  int _crossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      return 4; // Adjusted cross axis count for larger screens
    } else if (screenWidth > 400) {
      return 2; // Adjusted cross axis count for medium-sized screens
    } else {
      return 1; // Default cross axis count for smaller screens
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: players.isEmpty ? const Center(
      child: CircularProgressIndicator(),
    ):
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: players.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _crossAxisCount(context),
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (context, index) {
            final playerData = players[index];
                  return  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Image.network(playerData['ImagePlayer']),
                            ),
                          );
                        },
                      );
                    },
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5)
                              ),
                              child: Image.network(
                                playerData['ImagePlayer'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              playerData['Name'] ?? '',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
              },
            ),
          ),
        ),
      bottomNavigationBar: const ResponsiveBottomNavBar(),

    );
  }
}
