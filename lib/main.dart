import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:wear_notifications/notificationService.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await initNotifications();
  runApp
  (
   const MaterialApp
   (
     home: MyApp()
   )
  );
}
class MyApp extends StatelessWidget
{
  const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return WatchShape
    (
      builder: (context, shape, child)
      {
        var screenSize=MediaQuery.of(context).size;
        final shapeForm=WatchShape.of(context);
        if(shapeForm==WearShape.round)
        {
          screenSize=Size((screenSize.width/2)*1.4142, (screenSize.height/2)*1.4142);
        }
        return AmbientMode
        (
          builder: (context, mode, child)
          {
            return mode==WearMode.active?const ActivePage():const AmbientPage();
          },
        );
      }
    );
  }
}
class AmbientPage extends StatelessWidget
{
  const AmbientPage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: Colors.black,
      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          const [
            FlutterLogo(size: 20),
            Text
            (
              'App Notifications',
              style: TextStyle
              (
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
class ActivePage extends StatefulWidget
{
  const ActivePage({ Key? key }) : super(key: key);
  @override
  State<ActivePage> createState() => _ActivePageState();
}
class _ActivePageState extends State<ActivePage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            const Text
            (
              "Aplicacion de notificaciones",
              style: TextStyle
              (
                fontSize: 10
              ),
            ),
            const SizedBox
            (
              height: 10,
            ),
            const Text
            (
              "Presiona para enviar notificacion",
              style: TextStyle
              (
                fontSize: 10,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox
            (
              height: 10,
            ),
            IconButton
            (
              onPressed:()
              {
                lanzarNotificacion();
              },
              icon: const Icon
              (
                Icons.notification_add,
                color: Colors.blue,
              )
            )
          ],
        )
      ),
    );
  }
}