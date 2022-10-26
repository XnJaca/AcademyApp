import 'package:flutter/material.dart';

class AlertPopUp extends StatelessWidget {
   final String err;
   final BuildContext context;
  const AlertPopUp({Key? key, required this.err, required this.context}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)), //this right here
    child: SizedBox(
      height: 120,
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              err,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 56, 132, 231)),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Center(
                    child: Text(
                      "Cerrar",
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
  }
}