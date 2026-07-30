import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

def ConstrainedMaterialsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_materials_endgame (A : AdmissibleClass) :
    ConstrainedMaterialsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse