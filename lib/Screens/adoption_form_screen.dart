import 'package:flutter/material.dart';

class AdoptionFormScreen extends StatefulWidget {
  final String? petName; // optional: get pet name from PetCard
  const AdoptionFormScreen({super.key, this.petName});

  @override
  State<AdoptionFormScreen> createState() => _AdoptionFormScreenState();
}

class _AdoptionFormScreenState extends State<AdoptionFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final reasonController = TextEditingController();

  String? selectedPetType;
  String? selectedGender;
  bool hasOtherPets = false;

  final petTypes = ['Dog', 'Cat', 'Bird', 'Rabbit', 'Fish'];
  final genders = ['Male', 'Female', 'Any'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.petName != null
            ? "Adopt ${widget.petName}"
            : "Pet Adoption Form"),
        centerTitle: true,
        backgroundColor: const Color(0xffd09035),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Personal Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 12),

                // Full Name
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter your name' : null,
                ),
                const SizedBox(height: 16),

                // Phone
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (value) =>
                      value != null && value.length < 10
                          ? 'Enter a valid phone number'
                          : null,
                ),
                const SizedBox(height: 24),

                // Pet Preference
                const Text(
                  "Pet Preference",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 12),

                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Select Pet Type",
                    border: OutlineInputBorder(),
                  ),
                  items: petTypes
                      .map((pet) =>
                          DropdownMenuItem(value: pet, child: Text(pet)))
                      .toList(),
                  onChanged: (value) => setState(() => selectedPetType = value),
                  validator: (value) =>
                      value == null ? 'Please choose a pet type' : null,
                ),
                const SizedBox(height: 16),

                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Preferred Gender",
                    border: OutlineInputBorder(),
                  ),
                  items: genders
                      .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                      .toList(),
                  onChanged: (value) => setState(() => selectedGender = value),
                ),
                const SizedBox(height: 16),

                // Checkbox
                CheckboxListTile(
                  activeColor: const Color(0xffd09035),
                  title: const Text("I already have other pets at home"),
                  value: hasOtherPets,
                  onChanged: (val) => setState(() => hasOtherPets = val ?? false),
                ),
                const SizedBox(height: 24),

                // Address Section
                const Text(
                  "Address Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: addressController,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    labelText: "Home Address",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.home),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter your address' : null,
                ),
                const SizedBox(height: 24),

                // Reason Section
                const Text(
                  "Why do you want to adopt?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: reasonController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: "Your reason for adoption",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.edit_note_outlined),
                  ),
                ),
                const SizedBox(height: 30),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffd09035),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _showSuccessDialog(context);
                      }
                    },
                    child: const Text(
                      "Submit Request",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 Success Dialog Function
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 80),
                const SizedBox(height: 16),
                const Text(
                  "Success!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Your adoption request has been submitted successfully. 🐶\nWe’ll contact you soon!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffd09035),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    Navigator.pop(context); // Go back to previous screen
                  },
                  child: const Text(
                    "Back to Home",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
