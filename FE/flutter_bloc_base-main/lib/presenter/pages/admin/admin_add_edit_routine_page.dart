import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/data/sources/network/network.dart';
import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'dart:io';

@RoutePage()
class AdminAddEditRoutinePage extends StatefulWidget {
  final String? routineId; // null = create, not null = edit
  final String? initialName;
  final String? initialDescription;
  final String? initialLevel;
  final int? initialDuration;
  final int? initialCalories;
  final String? initialTags;
  final bool? initialIsPremium;
  final int? initialOrderIndex;
  final String? initialPoseIds;
  final String? initialImageUrl;

  const AdminAddEditRoutinePage({
    super.key,
    this.routineId,
    this.initialName,
    this.initialDescription,
    this.initialLevel,
    this.initialDuration,
    this.initialCalories,
    this.initialTags,
    this.initialIsPremium,
    this.initialOrderIndex,
    this.initialPoseIds,
    this.initialImageUrl,
  });

  @override
  State<AdminAddEditRoutinePage> createState() => _AdminAddEditRoutinePageState();
}

class _AdminAddEditRoutinePageState extends State<AdminAddEditRoutinePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _durationController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _tagsController = TextEditingController();
  final _orderIndexController = TextEditingController();

  String _selectedLevel = 'BEGINNER';
  bool _isPremium = false;
  XFile? _selectedImage;
  bool _isLoading = false;
  
  List<YogaPoseDetails> _availablePoses = [];
  List<String> _selectedPoseIds = [];
  bool _isLoadingPoses = true;

  @override
  void initState() {
    super.initState();
    _loadAvailablePoses();
    
    if (widget.routineId != null) {
      // Edit mode
      _nameController.text = widget.initialName ?? '';
      _descriptionController.text = widget.initialDescription ?? '';
      _durationController.text = widget.initialDuration?.toString() ?? '';
      _caloriesController.text = widget.initialCalories?.toString() ?? '';
      _tagsController.text = widget.initialTags ?? '';
      _orderIndexController.text = widget.initialOrderIndex?.toString() ?? '';
      _selectedLevel = widget.initialLevel ?? 'BEGINNER';
      _isPremium = widget.initialIsPremium ?? false;
      
      // Parse pose IDs from comma-separated string
      if (widget.initialPoseIds != null && widget.initialPoseIds!.isNotEmpty) {
        _selectedPoseIds = widget.initialPoseIds!.split(',').map((e) => e.trim()).toList();
      }
    }
  }

  Future<void> _loadAvailablePoses() async {
    setState(() => _isLoadingPoses = true);
    try {
      final networkDataSource = provider.get<NetworkDataSource>();
      final response = await networkDataSource.getYogaPoses(
        0, // page
        100, // size - Get all poses
        '', // keyword
      );
      
      if (mounted) {
        setState(() {
          _availablePoses = response.data?.items ?? [];
          _isLoadingPoses = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoadingPoses = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load poses: $e'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _durationController.dispose();
    _caloriesController.dispose();
    _tagsController.dispose();
    _orderIndexController.dispose();
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

  void _showPoseSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Poses'),
        content: SizedBox(
          width: double.maxFinite,
          child: _isLoadingPoses
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: _availablePoses.length,
                  itemBuilder: (context, index) {
                    final pose = _availablePoses[index];
                    final isSelected = _selectedPoseIds.contains(pose.id);
                    
                    return CheckboxListTile(
                      title: Text(pose.name),
                      subtitle: Text('Level: ${pose.level ?? "N/A"}'),
                      value: isSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            _selectedPoseIds.add(pose.id);
                          } else {
                            _selectedPoseIds.remove(pose.id);
                          }
                        });
                        Navigator.of(context).pop();
                        _showPoseSelectionDialog(); // Reopen to show updated selection
                      },
                    );
                  },
                ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final networkDataSource = provider.get<NetworkDataSource>();
      
      // Prepare FormData
      final formData = FormData.fromMap({
        'name': _nameController.text,
        if (_descriptionController.text.isNotEmpty) 
          'description': _descriptionController.text,
        'level': _selectedLevel,
        if (_durationController.text.isNotEmpty)
          'durationMinutes': _durationController.text,
        if (_caloriesController.text.isNotEmpty)
          'estimatedCalories': _caloriesController.text,
        if (_tagsController.text.isNotEmpty)
          'tags': _tagsController.text,
        'isPremium': _isPremium.toString(),
        if (_orderIndexController.text.isNotEmpty)
          'orderIndex': _orderIndexController.text,
        if (_selectedPoseIds.isNotEmpty)
          'poseIds': _selectedPoseIds.join(','),
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
      if (widget.routineId == null) {
        // CREATE
        await networkDataSource.adminCreateYogaRoutine(formData);
      } else {
        // UPDATE
        await networkDataSource.adminUpdateYogaRoutine(widget.routineId!, formData);
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.routineId == null 
                ? 'Routine created successfully!' 
                : 'Routine updated successfully!'
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
    final isEditMode = widget.routineId != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Routine' : 'Create Routine'),
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
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _selectedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(_selectedImage!.path),
                          fit: BoxFit.cover,
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
                labelText: 'Routine Name *',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter routine name';
                }
                return null;
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
              maxLines: 3,
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

            // Duration
            TextFormField(
              controller: _durationController,
              decoration: const InputDecoration(
                labelText: 'Duration (minutes)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value != null && value.isNotEmpty && int.tryParse(value) == null) {
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
                labelText: 'Estimated Calories',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value != null && value.isNotEmpty && int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Tags
            TextFormField(
              controller: _tagsController,
              decoration: const InputDecoration(
                labelText: 'Tags (comma-separated)',
                border: OutlineInputBorder(),
                hintText: 'e.g., flexibility, strength, relaxation',
              ),
            ),
            const SizedBox(height: 16),

            // Order Index
            TextFormField(
              controller: _orderIndexController,
              decoration: const InputDecoration(
                labelText: 'Order Index',
                border: OutlineInputBorder(),
                hintText: 'Display order (optional)',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value != null && value.isNotEmpty && int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Premium switch
            SwitchListTile(
              title: const Text('Premium Routine'),
              subtitle: const Text('Requires premium subscription'),
              value: _isPremium,
              onChanged: (value) {
                setState(() => _isPremium = value);
              },
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 16),

            // Pose selection
            Card(
              child: ListTile(
                title: const Text('Selected Poses'),
                subtitle: Text(
                  _selectedPoseIds.isEmpty 
                    ? 'No poses selected' 
                    : '${_selectedPoseIds.length} pose(s) selected'
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: _showPoseSelectionDialog,
              ),
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
                      isEditMode ? 'Update Routine' : 'Create Routine',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
