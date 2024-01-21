import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LandingHeaderWidget extends StatelessWidget {
  const LandingHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {

    DateTime currentDate = DateTime.now();
    DateFormat format = DateFormat("dd MMM, yyyy");
    String formattedDate = format.format(currentDate);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 25, 16, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 45,
                  height: 45,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/156512514?v=4'),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.search,
                color: Colors.black45,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
