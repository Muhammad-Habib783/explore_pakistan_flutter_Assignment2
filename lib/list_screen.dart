import 'package:flutter/material.dart';

import 'app_drawer.dart';
import 'detail_screen.dart';
import 'page_frame.dart';
import 'shared.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: const AppDrawer(current: AppRoute.list),
        appBar: AppBar(
          leadingWidth: 104,
          leading: const DrawerBackLeading(),
          title: const Text(
            'Destinations',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: Text(
                '${destinations.length} places to explore',
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: destinations.length,
                itemBuilder: (context, index) => DestinationTile(
                  destination: destinations[index],
                  heroPrefix: 'list',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable card — matches Photo Gallery's favorites/photo-list card style.
class DestinationTile extends StatelessWidget {
  final Destination destination;
  final String heroPrefix;

  const DestinationTile({
    super.key,
    required this.destination,
    required this.heroPrefix,
  });

  @override
  Widget build(BuildContext context) {
    final heroTag = '$heroPrefix-${destination.name}';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1.5,
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        leading: Hero(
          tag: heroTag,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 64,
              height: 64,
              child: AssetPhoto(destination.image),
            ),
          ),
        ),
        title: Text(
          destination.name,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              const Icon(Icons.location_on, size: 14, color: Colors.black45),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  destination.location,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                destination: destination,
                heroTag: heroTag,
              ),
            ),
          );
        },
      ),
    );
  }
}