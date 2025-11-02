import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/data/sources/network/network.dart';
import 'dart:io';

@RoutePage()
class AdminAddEditPosePage extends StatefulWidget {
  final String? poseId; // null = create, not null = edit
  final String? initialName;
  final int? initialMinutes;
  final int? initialCalories;
  final String? initialLevel;
  final String? initialDescription;
  final String? initialImageUrl;

  const AdminAddEditPosePage({
    super.key,
    this.poseId,
    this.initialName,
    this.initialMinutes,
    this.initialCalories,
    this.initialLevel,
    this.initialDescription,
    this.initialImageUrl,
  });

  @override
  State<AdminAddEditPosePage> createState() => _AdminAddEditPosePageState();
}

class _AdminAddEditPosePageState extends State<AdminAddEditPosePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _minutesController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _descriptionController = TextEditingController();

  String _selectedLevel = 'BEGINNER';
  XFile? _selectedImage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.poseId != null) {
      // Edit mode
      _nameController.text = widget.initialName ?? '';
      _minutesController.text = widget.initialMinutes?.toString() ?? '';
      _caloriesController.text = widget.initialCalories?.toString() ?? '';
      _descriptionController.text = widget.initialDescription ?? '';
      _selectedLevel = widget.initialLevel ?? 'BEGINNER';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _minutesController.dispose();
    _caloriesController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final networkDataSource = provider.get<NetworkDataSource>();
      
      // Prepare FormData
      final formData = FormData.fromMap({
        'name': _nameController.text,
        'totalMinutes': _minutesController.text,
        'totalCalos': _caloriesController.text,
        'level': _selectedLevel,
        if (_descriptionController.text.isNotEmpty) 
          'description': _descriptionController.text,
      });

      // Add image if selected
      if (_selectedImage != null) {
        final file = File(_selectedImage!.path);
        formData.files.add(
          MapEntry(
            'image',
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }

      // Call API
      if (widget.poseId == null) {
        // CREATE
        await networkDataSource.adminCreateYogaPose(formData);
      } else {
        // UPDATE
        await networkDataSource.adminUpdateYogaPose(widget.poseId!, formData);
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.poseId == null 
                ? 'Pose created successfully!' 
                : 'Pose updated successfully!'
            ),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop(true); // Return true to indicate success
      }
    } catch (e) {
      if (mounted) {
        String errorMessage = 'Error: $e';
        
        // Parse DioException for better error messages
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
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = widget.poseId != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Yoga Pose' : 'Add New Pose'),
        actions: [
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Image picker
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: _selectedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          _selectedImage!.path,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(
                            Icons.add_photo_alternate,
                            size: 64,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : widget.initialImageUrl != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              widget.initialImageUrl!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_photo_alternate, size: 64, color: Colors.grey),
                              SizedBox(height: 8),
                              Text('Tap to select image', style: TextStyle(color: Colors.grey)),
                            ],
                          ),
              ),
            ),
            const SizedBox(height: 24),

            // Name
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Pose Name *',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter pose name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Minutes
            TextFormField(
              controller: _minutesController,
              decoration: const InputDecoration(
                labelText: 'Duration (minutes) *',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter duration';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Calories
            TextFormField(
              controller: _caloriesController,
              decoration: const InputDecoration(
                labelText: 'Calories *',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter calories';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Level dropdown
            DropdownButtonFormField<String>(
              value: _selectedLevel,
              decoration: const InputDecoration(
                labelText: 'Level *',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'BEGINNER', child: Text('Beginner')),
                DropdownMenuItem(value: 'INTERMEDIATE', child: Text('Intermediate')),
                DropdownMenuItem(value: 'ADVANCED', child: Text('Advanced')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedLevel = value);
                }
              },
            ),
            const SizedBox(height: 16),

            // Description
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 24),

            // Submit button
            ElevatedButton(
              onPressed: _isLoading ? null : _submitForm,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Text(
                      isEditMode ? 'Update Pose' : 'Create Pose',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
