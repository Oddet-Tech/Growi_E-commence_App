import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/events.dart';
import 'package:image_picker/image_picker.dart';

class Tickets extends StatelessWidget {
  const Tickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          /// FIRST CONTAINER
         GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EventsAvailableScreen(),
      ),
    );
  },
  child: Container(
    width: double.infinity,
    height: 170,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all( Radius.circular(12)),
      border: Border.all(
        color: Colors.black,
        width: 2,
      ),
      image: const DecorationImage(
        image: AssetImage('assets/ticket.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(
            Icons.confirmation_number_outlined,
            color: Colors.white,
            size: 28,
          ),
          SizedBox(width: 8),
          Text(
            'Event tickets',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: Offset(1, 1),
                  blurRadius: 4,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
),
          /// SECOND CONTAINER
        /*  Container(
            margin: const EdgeInsets.only(top: 12),
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              image: const DecorationImage(   
                image: AssetImage('assets/trans.png'), 
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.taxi_alert_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'I Transport',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 4,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
class Business extends StatefulWidget {
  const Business({super.key});
  @override
  State<Business> createState() => _BusinessState();
}
class _BusinessState extends State<Business> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _cellphoneController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  
  String? _selectedCategory;
  File? _selectedImage;
  File? _selectedVideo;
  final ImagePicker _picker = ImagePicker();
  final List<String> _categories = [
    'Phones',
    'Tablets',
    'Laptops',
    'Chargers',
    'Speakers',
    'Wireless Earbuds',
    'Gaming consoles',
    'TVs',
    'SmartWatches'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Selling Products',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        backgroundColor: const Color(0xFFF8EED2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name field
              const Text(
                '1. Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              // Surname field
              const Text(
                '2. Surname',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _surnameController,
                decoration: InputDecoration(
                  hintText: 'Enter your surname',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your surname';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              // Email field
              const Text(
                '3. Email',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              // ID Number field
              const Text(
                '4. ID Number',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(
                  hintText: 'Enter your ID number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your ID number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              // Cellphone Number field
              const Text(
                '5. Cellphone Number',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _cellphoneController,
                decoration: InputDecoration(
                  hintText: 'Enter your cellphone number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your cellphone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              // Product Price field
              const Text(
                '6. Product Price',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  hintText: 'Enter product price in Rands', 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Price must be greater than 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              // Category dropdown
              const Text(
                '7. Product Category',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                 padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],
                ),
                child: DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  hint: const Text('Select a category'),
                  items: _categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  isExpanded: true,
                ),
              ),
              const SizedBox(height: 30),
              
              // Upload section
              const Text(
                'Upload Media of the product you want to sell',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              
              Row(
                children: [
                  // Upload Picture button
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Add image picker functionality here
                        _showUploadDialog('picture');
                      },
                      icon: const Icon(Icons.image),
                      label: const Text('Upload Picture'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: const Color(0xFFF8EED2),
                        foregroundColor: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  
                  // Upload Video button
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Add video picker functionality here
                        _showUploadDialog('video');
                      },
                      icon: const Icon(Icons.video_library),
                      label: const Text('Upload Video'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: const Color(0xFFF8EED2),
                        foregroundColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              
              // Show selected files
              if (_selectedImage != null || _selectedVideo != null)
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_selectedImage != null)
                        Row(
                          children: [
                            const Icon(Icons.check_circle, color: Colors.green, size: 16),
                            const SizedBox(width: 8),
                            Text(
                              'Picture: ${_selectedImage!.path.split('/').last}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      if (_selectedVideo != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle, color: Colors.green, size: 16),
                              const SizedBox(width: 8),
                              Text(
                                'Video: ${_selectedVideo!.path.split('/').last}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              
              const SizedBox(height: 40),
              
              // Submit button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _submitForm();
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 6, 196, 60),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
  
  void _showUploadDialog(String type) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Upload ${type == 'picture' ? 'Picture' : 'Video'}'),
        content: Text('This would normally open the device gallery to select a ${type == 'picture' ? 'picture' : 'video'}.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context); // close dialog before opening picker
              if (type == 'picture') {
                final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
                if (picked != null) {
                  setState(() {
                    _selectedImage = File(picked.path);
                  });
                }
              } else {
                final XFile? picked = await _picker.pickVideo(source: ImageSource.gallery);
                if (picked != null) {
                  setState(() {
                    _selectedVideo = File(picked.path);
                  });
                }
              }
            },
            child: const Text('Select from Gallery'),
          ),
        ],
      ),
    );
  }
  
  void _submitForm() {
    // Build business data to return to caller
    final business = {
      'image': _selectedImage?.path,
      'video': _selectedVideo?.path,
      'name': _nameController.text.trim(),
      'price': _priceController.text.trim(),
    };

    // Pop and return business info to the previous screen
    Navigator.pop(context, business);
  }
  
  @override
  void dispose() {
    // Clean up controllers
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _idController.dispose();
    _cellphoneController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
class OrganizerApplicationForm extends StatefulWidget {
  const OrganizerApplicationForm({Key? key}) : super(key: key);

  @override
  State<OrganizerApplicationForm> createState() =>
      _OrganizerApplicationFormState();
}

class _OrganizerApplicationFormState extends State<OrganizerApplicationForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final organizerNameCtrl = TextEditingController();
  final contactNameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final eventNameCtrl = TextEditingController();
  final venueNameCtrl = TextEditingController();
  final venueAddressCtrl = TextEditingController();
  final expectedAttendanceCtrl = TextEditingController();
  final ticketPriceCtrl = TextEditingController();
  final ticketQuantityCtrl = TextEditingController();
  final previousEventsCtrl = TextEditingController();

  DateTime? eventDate;
  String eventType = 'Concert';

  bool hasHostedBefore = false;
  bool acceptFee = false;
  bool acceptPayoutDelay = false;
  bool confirmLegit = false;
  bool confirmAccuracy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apply to Host an Event')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              /// Organizer Info
              _textField(organizerNameCtrl, 'Organizer / Brand Name'),
              _textField(contactNameCtrl, 'Contact Person Name'),
              _textField(phoneCtrl, 'Phone Number', keyboard: TextInputType.phone),
              _textField(emailCtrl, 'Email Address',
                  keyboard: TextInputType.emailAddress),

              const SizedBox(height: 16),

              /// Event Background
              SwitchListTile(
                title: const Text('Have you hosted events before?'),
                value: hasHostedBefore,
                onChanged: (v) => setState(() => hasHostedBefore = v),
              ),

              if (hasHostedBefore)
                _textField(
                  previousEventsCtrl,
                  'Previous events details',
                  required: false,
                ),

              const SizedBox(height: 16),

              /// Event Details
              _textField(eventNameCtrl, 'Event Name'),

              DropdownButtonFormField<String>(
                value: eventType,
                items: const [
                  DropdownMenuItem(value: 'Concert', child: Text('Concert')),
                  DropdownMenuItem(value: 'Party', child: Text('Party')),
                  DropdownMenuItem(value: 'Conference', child: Text('Conference')),
                  DropdownMenuItem(value: 'Other', child: Text('Other')),
                ],
                onChanged: (v) => setState(() => eventType = v!),
                decoration: const InputDecoration(labelText: 'Event Type'),
              ),

              const SizedBox(height: 8),

              ListTile(
                title: Text(
                  eventDate == null
                      ? 'Select Event Date'
                      : eventDate!.toLocal().toString().split(' ')[0],
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: _pickDate,
              ),

              _textField(venueNameCtrl, 'Venue Name'),
              _textField(venueAddressCtrl, 'Venue Address'),
              _numberField(expectedAttendanceCtrl, 'Expected Attendance'),

              const SizedBox(height: 16),

              /// Ticketing
              _numberField(ticketPriceCtrl, 'Ticket Price'),
              _numberField(ticketQuantityCtrl, 'Total Tickets Available'),

              const SizedBox(height: 16),

              /// Agreements
              _checkbox('I accept Growi’s 3% fee', acceptFee,
                  (v) => setState(() => acceptFee = v)),
              _checkbox('I accept delayed payout after the event',
                  acceptPayoutDelay,
                  (v) => setState(() => acceptPayoutDelay = v)),
              _checkbox('This event is real and legitimate', confirmLegit,
                  (v) => setState(() => confirmLegit = v)),
              _checkbox('All information provided is accurate',
                  confirmAccuracy,
                  (v) => setState(() => confirmAccuracy = v)),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _submit,
                child: const Text('Submit Application'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helpers

  Widget _textField(TextEditingController c, String label,
      {TextInputType keyboard = TextInputType.text, bool required = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: c,
        keyboardType: keyboard,
        validator: required
            ? (v) => v == null || v.isEmpty ? 'Required' : null
            : null,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }

  Widget _numberField(TextEditingController c, String label) {
    return _textField(c, label, keyboard: TextInputType.number);
  }

  Widget _checkbox(String text, bool value, Function(bool) onChanged) {
    return CheckboxListTile(
      title: Text(text),
      value: value,
      onChanged: (v) => onChanged(v ?? false),
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() => eventDate = picked);
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    if (!acceptFee ||
        !acceptPayoutDelay ||
        !confirmLegit ||
        !confirmAccuracy ||
        eventDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept all terms')),
      );
      return;
    }

    // TODO: Send data to Firebase
    print('Application submitted');
  }
}
