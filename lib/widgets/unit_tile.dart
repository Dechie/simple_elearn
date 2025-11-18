import 'package:flutter/material.dart';

class UnitTile extends StatelessWidget {
  final String title;
  final List<Widget> parts;

  const UnitTile({super.key, required this.title, required this.parts});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ExpansionTile(
          leading: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.folder_outlined,
              color: Theme.of(context).primaryColor,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              '${parts.length} parts',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ),
          tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          childrenPadding: EdgeInsets.only(bottom: 8),
          backgroundColor: Theme.of(context).cardColor,
          collapsedBackgroundColor: Theme.of(context).cardColor,
          iconColor: Theme.of(context).primaryColor,
          collapsedIconColor: Colors.grey[600],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          children: parts,
        ),
      ),
    );
  }
}
