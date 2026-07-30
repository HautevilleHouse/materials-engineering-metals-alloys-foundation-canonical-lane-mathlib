import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure ElasticityTensor where
  youngModulus : ℝ
  shearModulus : ℝ
  poissonRatio : ℝ
  bulkModulus : ℝ
  stiffnessMatrix : Prop
  complianceMatrix : Prop

structure ElasticityTensorEvidence (E : ElasticityTensor) where
  stiffnessMatrixClosed : E.stiffnessMatrix
  complianceMatrixClosed : E.complianceMatrix
  isotropicRelationsClosed : E.bulkModulus = E.youngModulus / (3 * (1 - 2 * E.poissonRatio))

def ElasticityTensorClosed (E : ElasticityTensor) : Prop :=
  E.stiffnessMatrix ∧ E.complianceMatrix ∧ (E.bulkModulus = E.youngModulus / (3 * (1 - 2 * E.poissonRatio)))

theorem elasticity_tensor_closed_from_evidence (E : ElasticityTensor) (Ev : ElasticityTensorEvidence E) : ElasticityTensorClosed E :=
  by
    exact And.intro Ev.stiffnessMatrixClosed (And.intro Ev.complianceMatrixClosed Ev.isotropicRelationsClosed)

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse