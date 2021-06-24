# Glass effect - for your skeleton loading
Show a glass effect using a single AnimationController over a list of Widgets.

<br><br>
<a href="https://en.apparence.io"><img src="https://github.com/Apparence-io/bart/raw/master/.github/img/logo.png" alt="Apparence.io logo"></a>
<p><small>Developed with 💙 &nbsp;by Apparence.io</small></p>


<p align="center">
<img src="https://github.com/Apparence-io/better_skeleton/blob/master/images/example.gif?raw=true" width="230" alt="Apparence.io better skeleton plugin gif">
</p>

## Tldr - features?
- Show a glass effect using a single AnimationController over a list of Widgets

## Getting Started
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

Note: FakeCard is a container widget we made with just a grey background. See example. 


