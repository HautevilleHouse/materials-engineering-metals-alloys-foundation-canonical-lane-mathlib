import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure PrecipitateParticle where
  averageRadius : ℝ
  volumeFraction : ℝ
  antiphaseBoundaryEnergy : ℝ

structure OrderPrecipitate where
  particle : PrecipitateParticle
  latticeMismatch : ℝ
  coherencyStress : ℝ

structure PrecipitationStrengtheningEvidence (O : OrderPrecipitate) where
  averageRadiusPositiveClosed : O.particle.averageRadius > 0
  volumeFractionInRangeClosed : O.particle.volumeFraction ≤ 1 ∧ O.particle.volumeFraction ≥ 0
  coherencyStressPositiveClosed : O.coherencyStress > 0

def PrecipitationStrengtheningClosed (O : OrderPrecipitate) : Prop :=
  O.particle.averageRadius > 0 ∧ (O.particle.volumeFraction ≤ 1 ∧ O.particle.volumeFraction ≥ 0) ∧ O.coherencyStress > 0

theorem precipitation_strengthening_closed_from_evidence (O : OrderPrecipitate) (E : PrecipitationStrengtheningEvidence O) : PrecipitationStrengtheningClosed O :=
  by
    exact And.intro E.averageRadiusPositiveClosed (And.intro E.volumeFractionInRangeClosed E.coherencyStressPositiveClosed)

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse