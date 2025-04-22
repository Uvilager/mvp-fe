import 'package:mvp_fe/features/fundraisers/domain/models/fundraiser.dart';

abstract class FundraisersRepository {
  Future<List<Fundraiser>> getFundraisers();
  Future<Fundraiser> getFundraiser(
    int id,
  ); // Added method to get single fundraiser
}
