# On Screen Ruler

Draw overlay 8px square on top of your apps, you're going to need this if your client has an eagle eye.

## Installing

#### 1. Get the package
   Add this to your pubspec.yaml file: 
```
dependencies:
  on_screen_ruler: ^0.0.1
```

#### 2. Install
Install with:
```
flutter pub get
```
#### 3. Import
```
import 'package:on_screen_ruler/on_screen_ruler.dart';
```

### How to use
Put this piece of code inside your Material Widget
```
builder: (context, widget) {
  return OnScreenRulerWidget(child: widget!);
},
```
Full code: 
```
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        return OnScreenRulerWidget(child: widget!);
      },
      home: MyHomePage(),
    );
  }
}
```
Double Tap Icon on the top to activate the virtual ruler... 

If you don't want the Icons and bacground on top of your apps you can set background color to transparent and pass null for the icon
```
OnScreenRulerWidget(
  child: widget!,
  activateBgColor: Colors.transparent,
  activateIcon: null,
);
```
You still can enable the virtual ruler by double tap on top of the screen

![image info](https://github.com/aldychris/on_screen_ruler/blob/master/screenshot/img1.png?raw=true)
![image info](https://github.com/aldychris/on_screen_ruler/blob/master/screenshot/img2.png?raw=true)

#### Widget Option
Key | Type | Default | Description
------------ | ------------- | ------------- | -------------
show | bool | false | Show or hide ruler
gridSize | double | 8.0 | Size of the grid
gridColor | Color | Colors.black12 | Color line of the grid
activateBgColor | Color | Colors.black12 | Background of activate button
activateIcon | Icon | Icon(Icons.expand) | Icon of activate overlay ruler
