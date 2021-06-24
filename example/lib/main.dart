import 'package:flutter/material.dart';

import 'package:better_skeleton/better_skeleton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000))..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 100),
            AnimatedSkeleton(
              listenable: animationController,
              child: FakeCard(),
            ),
            AnimatedSkeleton(
              listenable: animationController,
              child: FakeCard(),
            ),
            AnimatedSkeleton(
              listenable: animationController,
              child: FakeCard2(),
            ),
          ],
        ),
      ),
    );
  }
}

class FakeCard extends StatelessWidget {
  const FakeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        color: Colors.grey[300],
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FakeCard2 extends StatelessWidget {
  const FakeCard2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        color: Colors.grey[300],
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.circular(5)),
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.circular(5)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
