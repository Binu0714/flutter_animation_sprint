import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});
  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  // Starter Structure from Doc
  bool _expanded = false;
  double _height = 80;
  Color _bgColor = Colors.white;

  void _toggle() => setState(() {
    _expanded = !_expanded;
    _height = _expanded ? 220 : 80;
    _bgColor = _expanded ? Colors.blue.shade50 : Colors.white;
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic, // Requirement
        height: _height,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _bgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const Row(
                children: [
                  CircleAvatar(child: Icon(Icons.person)),
                  SizedBox(width: 10),
                  Text("Team Member", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              AnimatedOpacity(
                opacity: _expanded ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text("Bio: Flutter Developer working on animations."),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Icon(Icons.share), Icon(Icons.thumb_up), Icon(Icons.email)],
                      ),
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