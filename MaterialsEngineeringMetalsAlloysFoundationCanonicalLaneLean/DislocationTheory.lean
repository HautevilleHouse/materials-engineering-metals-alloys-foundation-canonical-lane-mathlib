import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure DislocationTheoryPackage where
  burgersVector : Type
  dislocationLine : Type
  slipPlane : Type
  peierlsStress : Prop
  dislocationMotion : Prop

structure DislocationTheoryEvidence (D : DislocationTheoryPackage) where
  burgersVectorClosed : D.burgersVector
  dislocationLineClosed : D.dislocationLine
  slipPlaneClosed : D.slipPlane
  peierlsStressClosed : D.peierlsStress
  dislocationMotionClosed : D.dislocationMotion

def DislocationTheoryClosed (D : DislocationTheoryPackage) : Prop :=
  D.burgersVector ∧ D.dislocationLine ∧ D.slipPlane ∧ D.peierlsStress ∧ D.dislocationMotion

theorem dislocation_theory_closed_from_evidence (D : DislocationTheoryPackage)
    (E : DislocationTheoryEvidence D) : DislocationTheoryClosed D := by
  exact And.intro E.burgersVectorClosed (And.intro E.dislocationLineClosed
    (And.intro E.slipPlaneClosed (And.intro E.peierlsStressClosed E.dislocationMotionClosed)))

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse
