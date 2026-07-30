import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MaterialsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.gateWitness

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse