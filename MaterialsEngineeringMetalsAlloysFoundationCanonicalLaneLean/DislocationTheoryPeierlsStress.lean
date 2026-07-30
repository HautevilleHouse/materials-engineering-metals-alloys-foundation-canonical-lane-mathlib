import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure PeierlsStressPackage where
  dislocationCore : Type u
  burgersVector : Prop
  slipPlane : Prop
  peierlsBarrier : Prop
  criticalResolvedShearStress : Prop

structure PeierlsStressEvidence (P : PeierlsStressPackage) where
  dislocationCoreClosed : P.dislocationCore
  burgersVectorClosed : P.burgersVector
  slipPlaneClosed : P.slipPlane
  peierlsBarrierClosed : P.peierlsBarrier
  criticalResolvedShearStressClosed : P.criticalResolvedShearStress

def PeierlsStressClosed (P : PeierlsStressPackage) : Prop :=
  P.dislocationCore ∧ P.burgersVector ∧ P.slipPlane ∧ P.peierlsBarrier ∧ P.criticalResolvedShearStress

theorem peierls_stress_closed_from_evidence (P : PeierlsStressPackage) (E : PeierlsStressEvidence P) :
    PeierlsStressClosed P := by
  exact And.intro E.dislocationCoreClosed (And.intro E.burgersVectorClosed (And.intro E.slipPlaneClosed (And.intro E.peierlsBarrierClosed E.criticalResolvedShearStressClosed)))

end HautevilleHouse.MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse