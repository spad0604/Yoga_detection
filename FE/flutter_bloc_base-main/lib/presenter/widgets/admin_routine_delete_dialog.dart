import 'package:flutter/material.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/data/sources/network/network.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_starter/presenter/languages/translation_keys.g.dart';

class AdminRoutineDeleteDialog {
  static Future<bool?> show(BuildContext context, String routineId, String routineName) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Routine'),
        content: Text('Are you sure you want to delete "$routineName"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(LocaleKeys.Cancel.tr()),
          ),
          TextButton(
            onPressed: () async {
              try {
                final networkDataSource = provider.get<NetworkDataSource>();
                await networkDataSource.adminDeleteYogaRoutine(routineId);

                if (context.mounted) {
                  Navigator.of(context).pop(true);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Routine deleted successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  Navigator.of(context).pop(false);

                  String errorMessage = 'Failed to delete routine';
                  if (e is DioException) {
                    if (e.response?.statusCode == 401) {
                      errorMessage = LocaleKeys.UnauthorizedPleaseLoginAgain.tr();
                    } else if (e.response?.statusCode == 403) {
                      errorMessage = LocaleKeys.AccessDeniedAdminRequired.tr();
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
            child: Text(LocaleKeys.Delete.tr()),
          ),
        ],
      ),
    );
  }
}
