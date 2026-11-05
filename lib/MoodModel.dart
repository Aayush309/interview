import 'dart:ui';

import 'package:hugeicons/hugeicons.dart';

class Mood {
  const Mood({
    required this.name,
    required this.emoji,
    required this.icon,
    required this.message,
    required this.color,
  });

  final String name;
  final String emoji;
  final List<List<dynamic>> icon;
  final String message;
  final Color color;
}

const List<Mood> moods = [
  Mood(
    name: 'Happy',
    emoji: '😄',
    icon: HugeIcons.strokeRoundedSmile,
    message: 'Great day, Let\'s create something awesome today.',
    color: Color(0xFFFFE082),
  ),
  Mood(
    name: 'Focused',
    emoji: '🧠',
    icon: HugeIcons.strokeRoundedTarget01,
    message: 'Headphones on, building apps.',
    color: Color(0xFF90CAF9),
  ),
  Mood(
    name: 'Sleepy',
    emoji: '😴',
    icon: HugeIcons.strokeRoundedSleeping,
    message: 'Let\'s get some coffee',
    color: Color(0xFFCE93D8),
  ),
  Mood(
    name: 'Excited',
    emoji: '🚀',
    icon: HugeIcons.strokeRoundedRocket01,
    message: 'Excited to see the code work on the first attempt',
    color: Color(0xFFA5D6A7),
  ),
  Mood(
    name: 'Chill',
    emoji: '😎',
    icon: HugeIcons.strokeRoundedCoffee01,
    message: 'No bugs, no deadlines, just chill.',
    color: Color(0xFF80DEEA),
  ),
  Mood(
    name: 'Creative',
    emoji: '🎨',
    icon: HugeIcons.strokeRoundedIdea01,
    message: 'What if this button did a backflip?',
    color: Color(0xFFF48FB1),
  ),
  Mood(
    name: 'Stressed',
    emoji: '😵‍💫',
    icon: HugeIcons.strokeRoundedFire,
    message: 'Why is the build red again?',
    color: Color(0xFFFFAB91),
  ),
];