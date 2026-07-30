import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure DislocationDynamicsPackage where
  dislocationType : Type u
  burgersVector : Type v
  slipSystem : Type w
  peierlsStress : Prop
  frankReadSource : Prop
  dislocationMotion : Prop

structure DislocationDynamicsEvidence (D : DislocationDynamicsPackage) where
  peierlsStressClosed : D.peierlsStress
  frankReadSourceClosed : D.frankReadSource
  dislocationMotionClosed : D.dislocationMotion

def DislocationDynamicsClosed (D : DislocationDynamicsPackage) : Prop :=
  D.peierlsStress ∧ D.frankReadSource ∧ D.dislocationMotion

theorem dislocation_dynamics_closed_from_evidence
    (D : DislocationDynamicsPackage) (E : DislocationDynamicsEvidence D) :
    DislocationDynamicsClosed D := by
  exact And.intro E.peierlsStressClosed
    (And.intro E.frankReadSourceClosed E.dislocationMotionClosed)

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse