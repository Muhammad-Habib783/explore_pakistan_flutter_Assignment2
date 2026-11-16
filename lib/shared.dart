import 'package:flutter/material.dart';

// ---------- Colours (Photo Gallery palette) ----------
const Color kPrimary = Color(0xFF34483A);
const Color kDark = Color(0xFF26352C);
const Color kBackground = Color(0xFFF4F6F4);
const Color kSurround = Color(0xFFE8ECE8);

// ---------- Models ----------
class Destination {
  final String name;
  final String location;
  final String description;
  final String bestTime;
  final String image;
  final List<String> highlights;
  final IconData icon;
  final Color color;

  const Destination({
    required this.name,
    required this.location,
    required this.description,
    required this.bestTime,
    required this.image,
    required this.highlights,
    required this.icon,
    required this.color,
  });
}

class GalleryItem {
  final String caption;
  final String image;
  const GalleryItem({required this.caption, required this.image});
}

// ---------- Data ----------
const List<Destination> destinations = [
  Destination(
    name: 'Hunza Valley',
    location: 'Gilgit-Baltistan',
    description:
    'A famous mountain valley surrounded by high peaks, orchards and '
        'old forts. Popular for its calm atmosphere and scenic views.',
    bestTime: 'Spring to autumn',
    image: 'assets/images/hunza.jpg',
    highlights: ['Baltit Fort', 'Attabad Lake', 'Karimabad bazaar'],
    icon: Icons.landscape,
    color: Color(0xFF00796B),
  ),
  Destination(
    name: 'Skardu',
    location: 'Gilgit-Baltistan',
    description:
    'A gateway to some of the highest mountains in the world, with '
        'lakes, desert dunes and wide open plains nearby.',
    bestTime: 'Late spring to early autumn',
    image: 'assets/images/skardu.jpg',
    highlights: ['Deosai Plains', 'Upper Kachura Lake', 'Shigar Fort'],
    icon: Icons.terrain,
    color: Color(0xFF1565C0),
  ),
  Destination(
    name: 'Fairy Meadows',
    location: 'Gilgit-Baltistan',
    description:
    'A green meadow with a direct view of Nanga Parbat, reached by a '
        'scenic trek. A favourite for camping and photography.',
    bestTime: 'Summer',
    image: 'assets/images/fairy_meadows.jpg',
    highlights: ['Nanga Parbat view', 'Camping', 'Forest trek'],
    icon: Icons.forest,
    color: Color(0xFF2E7D32),
  ),
  Destination(
    name: 'Swat Valley',
    location: 'Khyber Pakhtunkhwa',
    description:
    'Known for its rivers, green hills and hill stations. Often '
        'called the Switzerland of the East.',
    bestTime: 'Spring and summer',
    image: 'assets/images/swat_valley.jpg',
    highlights: ['Malam Jabba', 'Kalam', 'Swat River'],
    icon: Icons.water,
    color: Color(0xFF00838F),
  ),
  Destination(
    name: 'Naran Kaghan',
    location: 'Khyber Pakhtunkhwa',
    description:
    'A popular valley with alpine lakes and mountain roads, loved by '
        'families and hikers during summer.',
    bestTime: 'June to September',
    image: 'assets/images/naran.jpg',
    highlights: ['Lake Saif-ul-Malook', 'Lulusar Lake', 'Babusar Top'],
    icon: Icons.hiking,
    color: Color(0xFF6A1B9A),
  ),
  Destination(
    name: 'Murree',
    location: 'Punjab',
    description:
    'A hill station close to Islamabad, ideal for a quick escape '
        'with cool weather and pine-covered hills.',
    bestTime: 'Summer and winter',
    image: 'assets/images/murree.jpg',
    highlights: ['Mall Road', 'Patriata', 'Pindi Point'],
    icon: Icons.cabin,
    color: Color(0xFF6D4C41),
  ),
  Destination(
    name: 'Lahore Fort',
    location: 'Lahore, Punjab',
    description:
    'A historic Mughal-era fort with palaces, gardens and detailed '
        'decoration. A must-see in the old city of Lahore.',
    bestTime: 'October to March',
    image: 'assets/images/lahore_fort.jpg',
    highlights: ['Sheesh Mahal', 'Alamgiri Gate', 'Naulakha Pavilion'],
    icon: Icons.castle,
    color: Color(0xFFC62828),
  ),
  Destination(
    name: 'Faisal Mosque',
    location: 'Islamabad',
    description:
    'A modern mosque with a distinctive design, set against the '
        'Margalla Hills. One of the main landmarks of the capital.',
    bestTime: 'Any time of year',
    image: 'assets/images/faisal_mosque.jpg',
    highlights: ['Modern architecture', 'Margalla Hills view', 'Large lawns'],
    icon: Icons.mosque,
    color: Color(0xFF283593),
  ),
  Destination(
    name: 'Mohenjo-daro',
    location: 'Sindh',
    description:
    'The remains of an ancient Indus Valley city and a UNESCO World '
        'Heritage Site, showing early urban planning.',
    bestTime: 'November to February',
    image: 'assets/images/mohenjo_daro.jpg',
    highlights: ['The Great Bath', 'Ancient streets', 'Site museum'],
    icon: Icons.account_balance,
    color: Color(0xFFB26A00),
  ),
  Destination(
    name: 'Clifton Beach',
    location: 'Karachi, Sindh',
    description:
    'A popular seaside spot in Karachi with a long shore, evening '
        'crowds and plenty of local street food.',
    bestTime: 'November to February',
    image: 'assets/images/clifton_beach.jpg',
    highlights: ['Beach promenade', 'Sunset views', 'Local snacks'],
    icon: Icons.beach_access,
    color: Color(0xFFEF6C00),
  ),
];

const List<GalleryItem> galleryItems = [
  GalleryItem(caption: 'Hunza Valley', image: 'assets/images/hunza.jpg'),
  GalleryItem(caption: 'Skardu', image: 'assets/images/skardu.jpg'),
  GalleryItem(caption: 'Fairy Meadows', image: 'assets/images/fairy_meadows.jpg'),
  GalleryItem(caption: 'Swat Valley', image: 'assets/images/swat_valley.jpg'),
  GalleryItem(caption: 'Naran Kaghan', image: 'assets/images/naran.jpg'),
  GalleryItem(caption: 'Murree', image: 'assets/images/murree.jpg'),
];

// ---------- Reusable image widget ----------
class AssetPhoto extends StatelessWidget {
  final String path;
  final BoxFit fit;

  const AssetPhoto(this.path, {super.key, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: fit,
      filterQuality: FilterQuality.high,
      errorBuilder: (context, error, stackTrace) => Container(
        color: const Color(0xFFE0E0E0),
        child: const Center(
          child: Icon(Icons.broken_image, color: Colors.black38, size: 32),
        ),
      ),
    );
  }
}