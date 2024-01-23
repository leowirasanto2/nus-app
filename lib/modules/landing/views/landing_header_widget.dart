import 'package:flutter/material.dart';
import 'package:nusapp/common/extensions/string_extension.dart';

class LandingHeaderWidget extends StatelessWidget {
  Function? onSearchTap;

  LandingHeaderWidget({super.key, this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/156512514?v=4'),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                (DateTime.now().toString().formattedDate(
                    expectedFormat: 'dd MMMM yyyy')).orEmpty,
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
          GestureDetector(
            onTap: () => onSearchTap?.call(),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.search,
                color: Colors.black45,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
