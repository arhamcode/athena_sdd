import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool loadingState;

  const RegisterButton({
    super.key,
    this.onPressed,
    this.loadingState = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15),
        backgroundColor: Colors.green,
      ),
      child: loadingState
          ? const SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : const Text(
              'Daftar',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
    );
  }
}
