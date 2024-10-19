import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart'; // Import the intl_phone_field package
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF195198),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 2),
            Center(
              child: Image.asset(
                'assets/logo/logo3.png',
                width: 130,
                height: 100,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Hello, welcome back!',
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFdde4e4),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                'Login',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight:FontWeight.bold,
                  color: const Color(0xFFdde4e4),
                ),
              ),
            ),
            const SizedBox(height: 10),
            _buildLoginForm(context, controller),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, LoginController controller) {
    return Column(
      children: [
        // Updated Phone Number Input with Country Code Picker
        Obx(() => _buildPhoneNumberField(controller)),
        const SizedBox(height: 20),
        Obx(() => _buildTextField(
          controller: controller.passwordController,
          label: 'Password',
          icon: Icons.lock,
          obscureText: !controller.isPasswordVisible.value,
          validator: controller.validatePassword,
          suffixIcon: IconButton(
            icon: Icon(
              controller.isPasswordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: () {
              controller.isPasswordVisible.value =
              !controller.isPasswordVisible.value;
            },
          ),
          errorText: controller.passwordErrorText.value, // Here we use .value to access the actual value
        )),
        const SizedBox(height: 30),
        Obx(() => Center(
          child: ElevatedButton(
            onPressed: controller.isLoading.value
                ? null
                : () async {
              bool isLoggedIn = await controller.login();
              if (isLoggedIn) {
                // Handle successful login
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              minimumSize: const Size(120, 50), // Set the minimum size for the button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: const Color(0xFFdde4e4),
              shadowColor: Colors.black.withOpacity(0.3),
              elevation: 8, // Creates the 3D effect
            ),
            child: controller.isLoading.value
                ? const CircularProgressIndicator(
              color: Colors.white,
            )
                : Text(
              'Login',
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF195198),
              ),
            ),
          ),
        )),
      ],
    );
  }

  // Updated Phone Number Field with Country Code Picker
  Widget _buildPhoneNumberField(LoginController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFdde4e4),
            borderRadius: BorderRadius.circular(10),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     blurRadius: 10,
            //     offset: const Offset(4, 4),
            //   ),
            //   BoxShadow(
            //     color: Colors.white.withOpacity(0.5),
            //     blurRadius: 10,
            //     offset: const Offset(-4, -4),
            //   ),
            // ],
          ),
          child: IntlPhoneField(
            controller: controller.phoneNumberController,
            decoration: InputDecoration(
              labelText: 'Phone',
              labelStyle: GoogleFonts.openSans(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never, // Prevents the label from floating
            ),
            initialCountryCode: 'TZ', // Default country code (Tanzania)
            showCountryFlag: true, // Show the country flag only
            showDropdownIcon: true, // Show the dropdown for country selection
            disableLengthCheck: true, // Disable automatic length check for flexibility
            autovalidateMode: AutovalidateMode.disabled, // Disable auto-validation
            onChanged: (phone) {
              // Only update the text field with the national phone number (without the country code)
              controller.phoneNumberController.text = '${phone.number}';
            },
            onCountryChanged: (country) {
              // Handle country code change
              controller.countryCode('+${country.dialCode}'); // Update the country code

            },
          ),
        ),
        if (controller.phoneNumberErrorText.value != null) // If there's an error, display it outside
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              controller.phoneNumberErrorText.value!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required String? Function(String) validator,
    String? errorText, // Added errorText to show validation error outside of the field
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align error text to the left
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFdde4e4),
            borderRadius: BorderRadius.circular(10),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     blurRadius: 10,
            //     offset: const Offset(4, 4),
            //   ),
            //   BoxShadow(
            //     color: Colors.white.withOpacity(0.5),
            //     blurRadius: 10,
            //     offset: const Offset(-4, -4),
            //   ),
            // ],
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: GoogleFonts.openSans(),
              prefixIcon: Icon(icon),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never, // Hide label once typing starts
              hintText: label, // Custom hint text to act as the label
            ),
          ),
        ),
        if (errorText != null) // If there's an error, display it outside the input field
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              errorText,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
