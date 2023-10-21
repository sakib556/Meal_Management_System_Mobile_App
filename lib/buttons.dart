import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const RoundedButton({
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          border: Border.all(
              color: Colors.black, width: 1), // Border color and width
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black, // Text color
            ),
          ),
        ),
      ),
    );
  }
}

class PlusMinusButton extends StatefulWidget {
  final String title;
  final Function(bool isPlus) onValueChanged;
  final bool isTimer;
  const PlusMinusButton({
    Key? key,
    required this.title,
    this.isTimer = false,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  _PlusMinusButtonState createState() => _PlusMinusButtonState();
}

class _PlusMinusButtonState extends State<PlusMinusButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.black),
                ),
              ),
              child: Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: GestureDetector(
                    onTap: () {
                      widget.onValueChanged(false);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.black),
                ),
              ),
              child: Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: GestureDetector(
                    onTap: () {
                      widget.onValueChanged(true);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
