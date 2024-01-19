import 'package:flutter/material.dart';

class LandingHeaderWidget extends StatelessWidget {
  const LandingHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 25, 16, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  width: 45,
                  height: 45,
                  child: Image.network(
                    'https://cdn.dribbble.com/users/3416941/avatars/normal/2d977a5554be90b8731ce1ea8336de38.jpg?1700737919',
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Text(
                  '10 Jan, 2024',
                  style: TextStyle(
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
