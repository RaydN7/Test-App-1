//navigating to new page
import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false; // to keep the switch initially off state
  bool? isCheckbox = false; // now it can be null also
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Learn Flutter'), // this would appear on redirected page
        automaticallyImplyLeading: false, // removes default back arrow
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(); // pop will just delete the page
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Actions');
            },
            icon: const Icon(
              Icons
                  .info_outline, //The info_outline icon is a simple circle with the letter "i" inside and is used to indicate that the user can access more information or details about a specific item, feature, or action.
            ),
          ),
        ], //we can add list of icon buttons
      ),
      body: SingleChildScrollView(
        //SingleChildScrollView is used to add scrolling feature
        child: Column(
          // under this column is list
          children: [
            Image.asset(
                'images/PXL_20230114_180048600.NIGHT.jpg'), // child allows to add widget inside
            const SizedBox(
              height: 10,
            ), // to add space below margin
            const Divider(
              color: Colors
                  .black, // divider widget adds a slight margin below the image
            ),
            Container(
              margin: const EdgeInsets.all(
                  10.0), // adds little space in 'This is a text widget' bar.
              padding: const EdgeInsets.all(
                  10.0), // adds padding between text and container
              color: Colors
                  .blueGrey, // similar to SizedBox, but can do a lot more things
              width: double
                  .infinity, // text widget bar becomes infinite i.e end to end screen display
              child: const Center(
                child: Text(
                  'This is a text widget',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // '?' means 'if this is true' , ':' means 'otherwise'
                  backgroundColor: isSwitch
                      ? Colors.green
                      : Colors
                          .blue, // 'primary:' keyword was used earlier instead of backgroundColor
                ),
                onPressed: () {
                  debugPrint('Elevated Button');
                },
                child: const Text('Elevated Button')),

            OutlinedButton(
                onPressed: () {
                  debugPrint('Outlined Button');
                },
                child: const Text('Outlined Button')),

            TextButton(
                onPressed: () {
                  debugPrint('Text Button');
                },
                child: const Text('Text Button')),

            GestureDetector(
              behavior: HitTestBehavior
                  .opaque, // this would trigger the below written text when clicked anywhere on screen
              onTap: () {
                //empty function ()
                debugPrint(
                    'This is the row'); // this would be printed when blue icons are clicked
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // icons and 'Row widget' spaced evenly
                children: const [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blue,
                  ),
                  Text('Row Widget'),
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Switch(
                value: isSwitch,
                onChanged: (bool newBool) {
                  setState(() {
                    isSwitch =
                        newBool; // this is written inside setState so that to refresh the screen
                  });
                }),
            Checkbox(
                value: isCheckbox,
                onChanged: (bool? newBool) {
                  // nullable means it can be null
                  setState(() {
                    // setState used to refresh the screen
                    isCheckbox = newBool;
                  });
                }),
            Image.network(
                'https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-thumb.jpg') // url of image used
          ],
        ),
      ), // body is middle of the app
    );
  }
}
