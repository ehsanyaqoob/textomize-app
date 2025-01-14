import 'package:textomize/core/exports.dart';

class SimplifyLoader extends StatelessWidget {

  const SimplifyLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(10)
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xffD8AF69)),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}