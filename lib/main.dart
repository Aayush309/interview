import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import 'MoodModel.dart';

void main() => runApp(const MoodApplication());

class MoodApplication extends StatelessWidget {
  const MoodApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const MoodCard(),
    );
  }
}

class MoodCard extends StatefulWidget {
  const MoodCard({super.key});

  @override
  State<MoodCard> createState() => _MoodCardState();
}

class _MoodCardState extends State<MoodCard> {
  final math.Random _random = math.Random();

  int _moodIndex = 0;
  int _moodChangeCount = 0;

  Mood get _currentMood => moods[_moodIndex];

  void _changeMood() {
    final int step = 1 + _random.nextInt(moods.length - 1);

    setState(() {
      _moodIndex = (_moodIndex + step) % moods.length;
      _moodChangeCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width >600? 650 : 450
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: _currentMood.color,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (child, animation) =>
                        ScaleTransition(scale: animation, child: child),
                    child: Text(
                      _currentMood.emoji,
                      key: ValueKey(_currentMood.name),
                      style: const TextStyle(fontSize: 72),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Aayush', style: textTheme.headlineMedium),
                  const SizedBox(height: 24),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: Column(
                      key: ValueKey(_currentMood.name),
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            HugeIcon(
                              icon: _currentMood.icon,
                              color: Colors.black87,
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Feeling ${_currentMood.name}',
                              style: textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _currentMood.message,
                          textAlign: TextAlign.center,
                          style: textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Mood changes: $_moodChangeCount',
                    style: textTheme.labelLarge,
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: _changeMood,
                    child: const Text('Change my mood'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}