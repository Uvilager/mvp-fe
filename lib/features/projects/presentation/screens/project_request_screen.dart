import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

import '../../domain/models/simple_district.dart';
import '../../domain/models/simple_project_request.dart';
import '../providers/simple_project_request_provider.dart';

class ProjectRequestScreen extends ConsumerStatefulWidget {
  const ProjectRequestScreen({super.key});

  @override
  ConsumerState<ProjectRequestScreen> createState() => _ProjectRequestScreenState();
}

class _ProjectRequestScreenState extends ConsumerState<ProjectRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _budgetController = TextEditingController();
  final _minUsersController = TextEditingController();
  final _maxUsersController = TextEditingController();

  District? _selectedDistrict;
  DateTime? _startDate;
  DateTime? _endDate;
  List<File> _mediaFiles = [];
  final ImagePicker _imagePicker = ImagePicker();

  // Colors
  static const Color primaryColor = Color(0xFFf08a6e);
  static const Color secondaryColor = Color(0xFF2c3e50);
  static const Color lightColor = Color(0xFFf9f7f4);
  static const Color whiteColor = Colors.white;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _budgetController.dispose();
    _minUsersController.dispose();
    _maxUsersController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate 
        ? (_startDate ?? DateTime.now().add(const Duration(days: 1)))
        : (_endDate ?? DateTime.now().add(const Duration(days: 7))),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor,
              onPrimary: whiteColor,
              surface: whiteColor,
              onSurface: secondaryColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
          // Reset end date if it's before start date
          if (_endDate != null && _endDate!.isBefore(picked)) {
            _endDate = null;
          }
        } else {
          _endDate = picked;
        }
      });
    }
  }

  Future<void> _addMediaFromCamera() async {
    if (kIsWeb) {
      _showErrorSnackBar('Kamera nije dostupna na web platformi. Koristite galeriju.');
      return;
    }
    
    try {
      final XFile? photo = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );
      
      if (photo != null) {
        setState(() {
          _mediaFiles.add(File(photo.path));
        });
      }
    } catch (e) {
      _showErrorSnackBar('Greška pri snimanju fotografije: $e');
    }
  }

  Future<void> _addMediaFromGallery() async {
    try {
      FilePickerResult? result;
      
      if (kIsWeb) {
        // On web, use specific file types instead of FileType.media
        result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: true,
          allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'mp4', 'mov', 'avi'],
          withData: true, // Important for web
        );
      } else {
        // On mobile platforms
        result = await FilePicker.platform.pickFiles(
          type: FileType.media,
          allowMultiple: true,
        );
      }

      if (result != null && result.files.isNotEmpty) {
        List<File> newFiles = [];
        
        for (var file in result.files) {
          if (kIsWeb) {
            // On web, we need to handle bytes differently
            if (file.bytes != null) {
              // For web, we'll create a temporary file representation
              // Note: File operations on web are limited, so we might need to handle this differently
              _showErrorSnackBar('Web upload funkcionalnost je u razvoju. Molimo koristite mobilnu aplikaciju za upload medija.');
              return;
            }
          } else {
            // On mobile platforms
            if (file.path != null) {
              newFiles.add(File(file.path!));
            }
          }
        }
        
        if (newFiles.isNotEmpty) {
          setState(() {
            _mediaFiles.addAll(newFiles);
            // Limit to 5 files
            if (_mediaFiles.length > 5) {
              _mediaFiles = _mediaFiles.take(5).toList();
              _showErrorSnackBar('Maksimalno 5 medijskih fajlova je dozvoljeno');
            }
          });
        }
      }
    } catch (e) {
      _showErrorSnackBar('Greška pri izboru fajlova: $e');
    }
  }

  void _removeMedia(int index) {
    setState(() {
      _mediaFiles.removeAt(index);
    });
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _submitRequest() async {
    if (!_formKey.currentState!.validate() || _selectedDistrict == null) {
      _showErrorSnackBar('Molimo popunite sva obavezna polja');
      return;
    }

    // Parse numbers safely
    int? minUsers;
    int? maxUsers;
    
    if (_minUsersController.text.isNotEmpty) {
      minUsers = int.tryParse(_minUsersController.text);
    }
    
    if (_maxUsersController.text.isNotEmpty) {
      maxUsers = int.tryParse(_maxUsersController.text);
    }

    final request = ProjectRequest(
      districtId: _selectedDistrict!.id,
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      startDate: _startDate,
      endDate: _endDate,
      minUsers: minUsers,
      maxUsers: maxUsers,
      budget: _budgetController.text.isNotEmpty ? _budgetController.text.trim() : null,
      mediaFiles: _mediaFiles.isNotEmpty ? _mediaFiles : null,
    );

    await ref.read(projectRequestNotifierProvider.notifier).submitProjectRequest(request);
  }

  @override
  Widget build(BuildContext context) {
    final districtsAsync = ref.watch(districtsProvider);
    final requestState = ref.watch(projectRequestNotifierProvider);

    // Listen to request state changes
    ref.listen<AsyncValue<ProjectRequestResponse?>>(
      projectRequestNotifierProvider,
      (previous, next) {
        next.whenOrNull(
          data: (response) {
            if (response != null) {
              _showSuccessSnackBar('Zahtev za projekat je uspešno poslat!');
              context.pop();
            }
          },
          error: (error, _) {
            _showErrorSnackBar(error.toString());
          },
        );
      },
    );

    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        foregroundColor: whiteColor,
        title: const Text(
          'Predloži projekat',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () => context.pop(),
        ),
      ),
      body: districtsAsync.when(
        data: (districts) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        size: 48,
                        color: primaryColor,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Imate ideju za projekat?',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Podelite svoju ideju sa nama i pomozite da zajedno napravimo pozitivnu promenu u zajednici.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Form Fields
                _buildFormCard([
                  // District Dropdown
                  _buildSectionTitle('Opština *'),
                  DropdownButtonFormField<District>(
                    value: _selectedDistrict,
                    decoration: _buildInputDecoration('Izaberite opštinu'),
                    dropdownColor: whiteColor,
                    style: const TextStyle(
                      color: secondaryColor,
                      fontSize: 16,
                    ),
                    items: districts.map((district) {
                      return DropdownMenuItem<District>(
                        value: district,
                        child: Text(
                          district.name,
                          style: const TextStyle(
                            color: secondaryColor,
                            fontSize: 16,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedDistrict = value;
                      });
                    },
                    validator: (value) => value == null ? 'Molimo izaberite opštinu' : null,
                  ),
                  const SizedBox(height: 16),

                  // Title
                  _buildSectionTitle('Naziv projekta *'),
                  TextFormField(
                    controller: _titleController,
                    decoration: _buildInputDecoration('Unesite naziv projekta'),
                    style: const TextStyle(color: secondaryColor),
                    maxLength: 255,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Molimo unesite naziv projekta';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Description
                  _buildSectionTitle('Opis projekta *'),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: _buildInputDecoration('Opišite vaš projekat detaljno'),
                    style: const TextStyle(color: secondaryColor),
                    maxLines: 5,
                    maxLength: 2000,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Molimo unesite opis projekta';
                      }
                      return null;
                    },
                  ),
                ]),

                const SizedBox(height: 16),

                // Dates Section
                _buildFormCard([
                  _buildSectionTitle('Datumi (opciono)'),
                  Column(
                    children: [
                      // Start Date
                      InkWell(
                        onTap: () => _selectDate(context, true),
                        child: InputDecorator(
                          decoration: _buildInputDecoration('Datum početka'),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.grey[600],
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                _startDate != null 
                                  ? DateFormat('dd.MM.yyyy').format(_startDate!)
                                  : 'Izaberite datum početka',
                                style: TextStyle(
                                  color: _startDate != null 
                                    ? secondaryColor 
                                    : Colors.grey[600],
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // End Date
                      InkWell(
                        onTap: () => _selectDate(context, false),
                        child: InputDecorator(
                          decoration: _buildInputDecoration('Datum završetka'),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.grey[600],
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                _endDate != null 
                                  ? DateFormat('dd.MM.yyyy').format(_endDate!)
                                  : 'Izaberite datum završetka',
                                style: TextStyle(
                                  color: _endDate != null 
                                    ? secondaryColor 
                                    : Colors.grey[600],
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),

                const SizedBox(height: 16),

                // Participants Section
                _buildFormCard([
                  _buildSectionTitle('Broj učesnika (opciono)'),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _minUsersController,
                          decoration: _buildInputDecoration('Minimum'),
                          style: const TextStyle(color: secondaryColor),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              final num = int.tryParse(value);
                              if (num == null || num < 1) {
                                return 'Unesite valjan broj';
                              }
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _maxUsersController,
                          decoration: _buildInputDecoration('Maksimum'),
                          style: const TextStyle(color: secondaryColor),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              final num = int.tryParse(value);
                              if (num == null || num < 1) {
                                return 'Unesite valjan broj';
                              }
                              final minNum = int.tryParse(_minUsersController.text);
                              if (minNum != null && num < minNum) {
                                return 'Mora biti ≥ minimum';
                              }
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ]),

                const SizedBox(height: 16),

                // Budget Section
                _buildFormCard([
                  _buildSectionTitle('Budžet (opciono)'),
                  TextFormField(
                    controller: _budgetController,
                    decoration: _buildInputDecoration('Opišite potreban budžet ili resurse'),
                    style: const TextStyle(color: secondaryColor),
                    maxLines: 3,
                    maxLength: 500,
                  ),
                ]),

                const SizedBox(height: 16),

                // Media Section
                _buildFormCard([
                  _buildSectionTitle('Medijski fajlovi (opciono)'),
                  Text(
                    'Dodajte do 5 slika ili video snimaka koji opisuju vaš projekat',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // Media Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _mediaFiles.length < 5 ? _addMediaFromCamera : null,
                          icon: const Icon(Icons.camera_alt),
                          label: const Text('Kamera'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: primaryColor,
                            side: BorderSide(color: primaryColor),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _mediaFiles.length < 5 ? _addMediaFromGallery : null,
                          icon: const Icon(Icons.photo_library),
                          label: const Text('Galerija'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: primaryColor,
                            side: BorderSide(color: primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  // Media Preview
                  if (_mediaFiles.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _mediaFiles.length,
                        itemBuilder: (context, index) {
                          final file = _mediaFiles[index];
                          return Container(
                            width: 100,
                            margin: const EdgeInsets.only(right: 8),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    file,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Icon(Icons.play_circle_outline, size: 40),
                                      );
                                    },
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: GestureDetector(
                                    onTap: () => _removeMedia(index),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        color: whiteColor,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ]),

                const SizedBox(height: 32),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: requestState.isLoading ? null : _submitRequest,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: whiteColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: requestState.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(whiteColor),
                          ),
                        )
                      : const Text(
                          'Pošaljite zahtev',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
          ),
        ),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Colors.red[400],
                ),
                const SizedBox(height: 16),
                Text(
                  'Greška pri učitavanju',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.red[700],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  style: TextStyle(
                    color: Colors.red[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref.invalidate(districtsProvider),
                  child: const Text('Pokušajte ponovo'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: secondaryColor,
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey[600]),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      filled: true,
      fillColor: whiteColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }
} 