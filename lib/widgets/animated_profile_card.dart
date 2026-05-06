import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});
  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
        height: _expanded ? 190 : 80, // Height adjusted to prevent overflow
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _expanded ? Colors.blue.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue.withOpacity(0.2)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: SingleChildScrollView( // Prevents bottom overflow
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.blue, child: Icon(Icons.person, color: Colors.white)),
                  SizedBox(width: 15),
                  Text("Team Member", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _expanded ? 1.0 : 0.0,
                child: const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text("Bio: Flutter Developer specialized in animations and smooth UI transitions."),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Icon(Icons.share, color: Colors.blue), Icon(Icons.thumb_up, color: Colors.blue), Icon(Icons.email, color: Colors.blue)],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}