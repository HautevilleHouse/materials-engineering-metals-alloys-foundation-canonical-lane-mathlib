import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure PhaseDiagramPackage where
  gibbsFreeEnergy : Type
  phaseBoundary : Prop
  equilibrium : Prop
  leverRule : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  gibbsFreeEnergyClosed : P.gibbsFreeEnergy
  phaseBoundaryClosed : P.phaseBoundary
  equilibriumClosed : P.equilibrium
  leverRuleClosed : P.leverRule

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.gibbsFreeEnergy ∧ P.phaseBoundary ∧ P.equilibrium ∧ P.leverRule

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage)
    (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.gibbsFreeEnergyClosed (And.intro E.phaseBoundaryClosed
    (And.intro E.equilibriumClosed E.leverRuleClosed))

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse
