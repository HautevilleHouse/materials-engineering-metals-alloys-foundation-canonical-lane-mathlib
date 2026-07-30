import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure AdmissibleObject where
  materialSystem : Type u
  propertyModel : Type v
  endpointSatisfied : Prop
  remainderRecorded : Prop

def MaterialsWitnessClosed (O : AdmissibleObject) : Prop :=
  O.endpointSatisfied ∨ O.remainderRecorded

structure AdmissibleClass where
  object : AdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MaterialsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse