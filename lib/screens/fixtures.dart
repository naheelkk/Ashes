import 'package:ashes/common/bottomNavBar.dart';
import 'package:ashes/services/db_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class FixturesPage extends StatefulWidget {
  const FixturesPage({Key? key}) : super(key: key);

  @override
  State<FixturesPage> createState() => _FixturesPageState();
}

class _FixturesPageState extends State<FixturesPage> {
  List fixtures = [];

  @override
  void initState() {
    super.initState();
    loadFixtures();
  }

  Future<void> loadFixtures() async {
    List fetchedFixtures = await FixtureService.getFixtures();
    setState(() {
      fixtures = fetchedFixtures;
    });
  }

  String _formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('E dd MMM');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fixtures.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.grey.shade800,
              ),
            )
          : ListView.separated(
              itemCount: fixtures.length,
              separatorBuilder: (context, index) => const Spacer(),
              itemBuilder: (context, index) {
                final fixture = fixtures[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 35,
                        child: Text(
                          _formatDate(fixture['Date']),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        children: [
                          ListTile(
                            leading: Image.network(
                              fixture['Team1'],
                              color: Colors.white,
                            ),
                            trailing: Image.network(
                              fixture['Team2'],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.location_on_outlined),
                                  Text(fixture['Location']),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                            child: const Text('Match Center'),
                            onPressed: () async {
                              final matchLink = fixture[
                                  'MatchLink']; // Assuming 'MatchLink' is the key for the URL in your database
                              final url = Uri.parse(matchLink);

                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Unable to launch URL'),
                                    content: const Text(
                                        'Please install Cricheroes to launch the url'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
      bottomNavigationBar: const ResponsiveBottomNavBar(),
    );
  }
}
