import 'package:flutter/material.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/data/sources/network/network.dart';
import 'package:dio/dio.dart';

class AdminPoseDeleteDialog {
  static Future<bool?> show(BuildContext context, String poseId, String poseName) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Pose'),
        content: Text('Are you sure you want to delete "$poseName"?\n\nThis action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              try {
                final networkDataSource = provider.get<NetworkDataSource>();
                await networkDataSource.adminDeleteYogaPose(poseId);
                
                if (context.mounted) {
                  Navigator.of(context).pop(true);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Pose deleted successfully'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  Navigator.of(context).pop(false);
                  
                  String errorMessage = 'Failed to delete pose';
                  if (e is DioException) {
                    if (e.response?.statusCode == 401) {
                      errorMessage = 'Unauthorized. Please login again.';
                    } else if (e.response?.statusCode == 403) {
                      errorMessage = 'Access denied. Admin permission required.';
                    } else if (e.response?.data != null) {
                      errorMessage = e.response?.data['message'] ?? errorMessage;
                    }
                  }
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorMessage),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 4),
                    ),
                  );
                }
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
