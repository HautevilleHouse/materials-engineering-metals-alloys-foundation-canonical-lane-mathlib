import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure WorkHardeningPackage where
  dislocationDensity : Type u
  flowStress : Prop
  strainHardeningExponent : Prop
  taylorEquation : Prop
  workHardeningCurve : Prop

structure WorkHardeningEvidence (W : WorkHardeningPackage) where
  dislocationDensityClosed : W.dislocationDensity
  flowStressClosed : W.flowStress
  strainHardeningExponentClosed : W.strainHardeningExponent
  taylorEquationClosed : W.taylorEquation
  workHardeningCurveClosed : W.workHardeningCurve

def WorkHardeningClosed (W : WorkHardeningPackage) : Prop :=
  W.dislocationDensity ∧ W.flowStress ∧ W.strainHardeningExponent ∧ W.taylorEquation ∧ W.workHardeningCurve

theorem work_hardening_closed_from_evidence (W : WorkHardeningPackage) (E : WorkHardeningEvidence W) :
    WorkHardeningClosed W := by
  exact And.intro E.dislocationDensityClosed (And.intro E.flowStressClosed (And.intro E.strainHardeningExponentClosed (And.intro E.taylorEquationClosed E.workHardeningCurveClosed)))

end HautevilleHouse.MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse