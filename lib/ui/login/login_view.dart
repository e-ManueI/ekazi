import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF195198),
      body: SafeArea(
        // Ensures content is visible within safe areas
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context)
                .unfocus(); // Close the keyboard when tapping outside
          },
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Padding(
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
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFdde4e4),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildLoginForm(context),
                      const Spacer(flex: 3),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Column(
      children: [
        Obx(() => _buildPhoneNumberField(context)),
        const SizedBox(height: 20),
        Obx(() => _buildPasswordField(context)),
        const SizedBox(height: 30),
        Obx(() => Center(
              child: ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus(); // Close the keyboard
                        bool isLoggedIn = await controller.login();
                        if (isLoggedIn) {
                          // Handle successful login
                        }
                      },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  minimumSize: const Size(120, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: const Color(0xFFdde4e4),
                  shadowColor: Colors.black.withOpacity(0.3),
                  elevation: 8,
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
                          color: const Color(0xFF195198),
                        ),
                      ),
              ),
            )),
      ],
    );
  }

  Widget _buildPhoneNumberField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFdde4e4),
            borderRadius: BorderRadius.circular(10),
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
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            initialCountryCode: 'TZ',
            showCountryFlag: true,
            showDropdownIcon: true,
            disableLengthCheck: true,
            autovalidateMode: AutovalidateMode.disabled,
            onChanged: (phone) {
              controller.phoneNumberController.text = phone.number;
            },
            onCountryChanged: (country) {
              controller.countryCode.value = '+${country.dialCode}';
            },
            onSubmitted: (_) => FocusScope.of(context).unfocus(),
          ),
        ),
        if (controller.phoneNumberErrorText.value != null)
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

  Widget _buildPasswordField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFdde4e4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller.passwordController,
            obscureText: !controller.isPasswordVisible.value,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: GoogleFonts.openSans(),
              prefixIcon: const Icon(Icons.lock),
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
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
          ),
        ),
        if (controller.passwordErrorText.value != null)
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              controller.passwordErrorText.value!,
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
