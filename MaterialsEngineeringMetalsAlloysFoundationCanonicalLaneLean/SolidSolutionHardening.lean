import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure SolidSolutionHardening where
  soluteConcentration : ℝ
  misfitParameter : ℝ
  shearModulus : ℝ
  burgersVector : ℝ
  criticalResolvedShearStressIncrease : ℝ

structure SolidSolutionHardeningEvidence (S : SolidSolutionHardening) where
  concentrationInRangeClosed : S.soluteConcentration ≥ 0 ∧ S.soluteConcentration ≤ 1
  misfitParameterFiniteClosed : S.misfitParameter > 0
  stressIncreasePositiveClosed : S.criticalResolvedShearStressIncrease > 0

def SolidSolutionHardeningClosed (S : SolidSolutionHardening) : Prop :=
  (S.soluteConcentration ≥ 0 ∧ S.soluteConcentration ≤ 1) ∧ S.misfitParameter > 0 ∧ S.criticalResolvedShearStressIncrease > 0

theorem solid_solution_hardening_closed_from_evidence (S : SolidSolutionHardening) (E : SolidSolutionHardeningEvidence S) : SolidSolutionHardeningClosed S :=
  by
    exact And.intro E.concentrationInRangeClosed (And.intro E.misfitParameterFiniteClosed E.stressIncreasePositiveClosed)

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse