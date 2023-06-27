<p align="center">
  <img src="https://github.com/Apparence-io/better_skeleton/raw/master/images/logo.png" alt="better skeleton logo" />
</p>
<br><br>

<p align="center">
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
  <a href="https://pub.dev/packages/usb_device"><img src="https://img.shields.io/pub/v/better_skeleton" alt="pub dev usb_device"></a>
</p>
<br>
<hr>
<br>

## 🚀&nbsp; Overview

Show a glass effect using a single AnimationController over a list of Widgets

<p align="center">
  <img src="https://github.com/Apparence-io/better_skeleton/blob/master/images/example.gif?raw=true" width="230" alt="Apparence.io better skeleton plugin gif">
</p>

## 📖&nbsp; Getting started

Create an animation controller in repeat mode then just provide this controller to every AnimatedSkeleton. 
This effect is made using a custom RenderWidget. 

Example of using:
```dart
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
```

> Note: FakeCard is a container widget we made with just a grey background. See example. 

## 📣&nbsp; Sponsor

<img src="https://github.com/Apparence-io/bart/raw/master/.github/img/apparence_logo.png" alt="logo apparence io" />
<br />
<br />

[Initiated and sponsored by Apparence.io.](https://apparence.io)

## 👥&nbsp; Contribution

Contributions are welcome.
Contribute by creating a PR or create an issue 🎉.