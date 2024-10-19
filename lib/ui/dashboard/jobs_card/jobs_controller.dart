import 'package:get/get.dart';

class JobController extends GetxController {
  // Available categories
  final List<String> categories = ["Remote", "Full Time", "Hybrid"];

  // Currently selected category index
  var selectedCategoryIndex = 0.obs;

  // List of all jobs (Replace with your actual job data)
  final List<Map<String, String>> allJobs = [
    {
      "image": "assets/images/nmb.png",
      "company": "Data Corp.",
      "title": "Data Analyst",
      "location": "San Francisco",
      "deadline": "30 Oct 2024",
      "category": "Remote",
    },
    {
      "image": "assets/images/techfoundation.png",
      "company": "Tech Co.",
      "title": "Software Engineer",
      "location": "Dar es salaam",
      "deadline": "28 Oct 2024",
      "category": "Remote",
    },
    {
      "image": "assets/images/barrick.png",
      "company": "Data Corp.",
      "title": "Data Analyst",
      "location": "San Francisco",
      "deadline": "30 Oct 2024",
      "category": "Hybrid",
    },
    {
      "image": "assets/images/absa.png",
      "company": "Data Corp.",
      "title": "Data Analyst",
      "location": "San Francisco",
      "deadline": "30 Oct 2024",
      "category": "Full Time",
    },
    {
      "image": "assets/images/nmb.png",
      "company": "Data Corp.",
      "title": "Data Analyst",
      "location": "San Francisco",
      "deadline": "30 Oct 2024",
      "category": "Hybrid",
    },
    {
      "image": "assets/images/nmb.png",
      "company": "Data Corp.",
      "title": "Data Analyst",
      "location": "San Francisco",
      "deadline": "30 Oct 2024",
      "category": "Full Time",
    },
    {
      "image": "assets/images/nmb.png",
      "company": "Data Corp.",
      "title": "Data Analyst",
      "location": "San Francisco",
      "deadline": "30 Oct 2024",
      "category": "Remote",
    },
    {
      "image": "assets/images/nmb.png",
      "company": "Data Corp.",
      "title": "Data Analyst",
      "location": "San Francisco",
      "deadline": "30 Oct 2024",
      "category": "Hybrid",
    },
    {
      "image": "assets/images/nmb.png",
      "company": "Data Corp.",
      "title": "Data Analyst",
      "location": "San Francisco",
      "deadline": "30 Oct 2024",
      "category": "Full Time",
    },
  ];

  // Filtered jobs based on selected category
  List<Map<String, String>> get filteredJobs {
    String selectedCategory = categories[selectedCategoryIndex.value];
    return allJobs.where((job) => job['category'] == selectedCategory).toList();
  }

  // Change selected category
  void switchCategory(int index) {
    selectedCategoryIndex.value = index;
  }
}
