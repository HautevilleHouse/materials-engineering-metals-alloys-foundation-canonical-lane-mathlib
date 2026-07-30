import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure SolidificationPackage where
  nucleation : Prop
  growthKinetics : Prop
  dendriteFormation : Prop
  segregation : Prop
  phaseTransformation : Prop

structure SolidificationEvidence (S : SolidificationPackage) where
  nucleationClosed : S.nucleation
  growthKineticsClosed : S.growthKinetics
  dendriteFormationClosed : S.dendriteFormation
  segregationClosed : S.segregation
  phaseTransformationClosed : S.phaseTransformation

def SolidificationClosed (S : SolidificationPackage) : Prop :=
  S.nucleation ∧ S.growthKinetics ∧ S.dendriteFormation ∧ S.segregation ∧ S.phaseTransformation

theorem solidification_closed_from_evidence (S : SolidificationPackage)
    (E : SolidificationEvidence S) : SolidificationClosed S := by
  exact And.intro E.nucleationClosed (And.intro E.growthKineticsClosed
    (And.intro E.dendriteFormationClosed (And.intro E.segregationClosed E.phaseTransformationClosed)))

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse
