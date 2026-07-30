import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure GibbsPhaseRulePackage where
  components : Nat
  phases : Nat
  degreesOfFreedom : Prop
  phaseBoundaryEquation : Prop
  leverRule : Prop

structure GibbsPhaseRuleEvidence (G : GibbsPhaseRulePackage) where
  componentsClosed : G.components = 1 ∨ G.components > 1
  phasesClosed : G.phases ≥ 1
  degreesOfFreedomClosed : G.degreesOfFreedom
  phaseBoundaryEquationClosed : G.phaseBoundaryEquation
  leverRuleClosed : G.leverRule

def GibbsPhaseRuleClosed (G : GibbsPhaseRulePackage) : Prop :=
  (G.components = 1 ∨ G.components > 1) ∧ G.phases ≥ 1 ∧ G.degreesOfFreedom ∧ G.phaseBoundaryEquation ∧ G.leverRule

theorem gibbs_phase_rule_closed_from_evidence (G : GibbsPhaseRulePackage) (E : GibbsPhaseRuleEvidence G) :
    GibbsPhaseRuleClosed G := by
  exact And.intro E.componentsClosed (And.intro E.phasesClosed (And.intro E.degreesOfFreedomClosed (And.intro E.phaseBoundaryEquationClosed E.leverRuleClosed)))

end HautevilleHouse.MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse