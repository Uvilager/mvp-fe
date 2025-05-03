import 'package:mvp_fe/features/sponsors/domain/models/sponsor.dart';

abstract class SponsorsRepository {
  Future<List<Sponsor>> getSponsors();
  Future<Sponsor> getSponsor(int id);
  Future<Map<String, dynamic>> getSponsorWithProjects(int id);
}
