import 'package:get/get.dart';
import 'candidates_model.dart';

class CandidateController extends GetxController {
  // Observable list of candidates
  var candidates = <Candidate>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCandidates();
  }

  // Function to load mock candidates
  void loadCandidates() {
    candidates.addAll([
      Candidate(
        name: 'Nashon Israel',
        profilePicture: 'assets/images/profile.jpg',
        position: 'Software Developer',
        location: 'Mwanza',
      ),
      Candidate(
        name: 'Juma Khasim',
        profilePicture: 'assets/images/profile.jpg',
        position: 'UI/UX Designer',
        location: 'Dar es Salaam',
      ),
      Candidate(
        name: 'Robert Johnson',
        profilePicture: 'assets/images/profile.jpg',
        position: 'Project Manager',
        location: 'Mbeya',
      ),
      Candidate(
        name: 'Anna Brown',
        profilePicture: 'assets/images/profile.jpg',
        position: 'Marketing Manager',
        location: 'Arusha',
      ),
      Candidate(
        name: 'Michael Lee',
        profilePicture: 'assets/images/profile.jpg',
        position: 'Data Scientist',
        location: 'Dodoma',
      ),
      Candidate(
        name: 'Emily Davis',
        profilePicture: 'assets/images/profile.jpg',
        position: 'HR Manager',
        location: 'Tanga',
      ),
      Candidate(
        name: 'Chris Wilson',
        profilePicture: 'assets/images/profile.jpg',
        position: 'Finance Officer',
        location: 'Morogoro',
      ),
      Candidate(
        name: 'Sophia Martinez',
        profilePicture: 'assets/images/profile.jpg',
        position: 'Graphic Designer',
        location: 'Iringa',
      ),
      Candidate(
        name: 'David Lopez',
        profilePicture: 'assets/images/profile.jpg',
        position: 'Backend Developer',
        location: 'Kilimanjaro',
      ),
      Candidate(
        name: 'Laura White',
        profilePicture: 'assets/images/profile.jpg',
        position: 'Full Stack Developer',
        location: 'Tabora',
      ),
    ]);
  }
}
