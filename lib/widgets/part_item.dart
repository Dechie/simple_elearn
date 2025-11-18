import 'package:flutter/material.dart';

class PartItem extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final VoidCallback onTap;

  const PartItem({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isCompleted
            ? Theme.of(context).colorScheme.secondary.withValues(alpha: 0.05)
            : Theme.of(context).primaryColor.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isCompleted
              ? Theme.of(context).colorScheme.secondary.withValues(alpha: 0.2)
              : Colors.grey.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isCompleted
                ? Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1)
                : Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Icon(
            isCompleted ? Icons.check_circle : Icons.play_circle_outline,
            color: isCompleted
                ? Theme.of(context).colorScheme.secondary
                : Colors.grey[600],
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            decoration: isCompleted ? TextDecoration.lineThrough : null,
            color: isCompleted ? Colors.grey[600] : null,
            fontWeight: isCompleted ? FontWeight.normal : FontWeight.w600,
            fontSize: 15,
          ),
        ),
        trailing: ElevatedButton(
          onPressed: isCompleted ? null : onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: isCompleted
                ? Colors.grey[300]
                : Theme.of(context).primaryColor,
            foregroundColor: isCompleted ? Colors.grey[600] : Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: isCompleted ? 0 : 2,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isCompleted ? 'Completed' : 'Start',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              if (!isCompleted) ...[
                SizedBox(width: 4),
                Icon(Icons.arrow_forward, size: 16),
              ],
            ],
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
