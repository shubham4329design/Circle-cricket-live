/// Circle Cricket Scoring Rules
/// Rules for circle cricket format
class CircleCricketRules {
  /// RULE 1: Direct air boundary → OUT, 0 runs, ball counted
  /// RULE 2: No ball direct air boundary → OUT, 0 runs + 1 extra, ball not counted
  /// RULE 3: Ground touch boundary → 4 runs
  /// RULE 4: Wide → 1 extra, ball not counted
  /// RULE 5: No ball → 1 extra, ball not counted
  /// RULE 6: Wicket → Batter out, 0 runs (except run-outs)

  static const Map<String, String> deliveryTypes = {
    'legal': 'Legal Delivery',
    'wide': 'Wide Ball',
    'noBall': 'No Ball',
    'bye': 'Bye',
    'legBye': 'Leg Bye',
  };

  static const Map<String, String> wicketTypes = {
    'bowled': 'Bowled',
    'caught': 'Caught',
    'lbw': 'LBW',
    'runOut': 'Run Out',
    'stumped': 'Stumped',
    'hitWicket': 'Hit Wicket',
    'retiredOut': 'Retired Out',
    'airBoundaryOut': 'Air Boundary Out',
    'noBallAirBoundaryOut': 'No Ball Air Boundary Out',
  };

  /// Air boundary detection logic
  static bool isAirBoundary(double distanceFromCrease) {
    /// Implement based on boundary radius
    return distanceFromCrease > 50.0; /// Default 50 feet
  }

  /// Calculate NRR (Net Run Rate)
  static double calculateNRR(int runsFor, double oversFor, int runsAgainst, double oversAgainst) {
    if (oversFor == 0 || oversAgainst == 0) return 0.0;
    return (runsFor / oversFor) - (runsAgainst / oversAgainst);
  }
}
