import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure ElasticConstants where
  youngModulus : ℝ
  poissonRatio : ℝ
  shearModulus : ℝ
  bulkModulus : ℝ

structure ElasticityEvidence (E : ElasticConstants) where
  youngModulusPositive : E.youngModulus > 0
  poissonRatioRange : -1 < E.poissonRatio ∧ E.poissonRatio < 0.5
  shearModulusPositive : E.shearModulus > 0
  bulkModulusPositive : E.bulkModulus > 0

def ElasticityClosed (E : ElasticConstants) : Prop :=
  E.youngModulus > 0 ∧
  (-1 < E.poissonRatio ∧ E.poissonRatio < 0.5) ∧
  E.shearModulus > 0 ∧
  E.bulkModulus > 0

theorem elasticity_closed_from_evidence (E : ElasticConstants) (Ev : ElasticityEvidence E) :
    ElasticityClosed E := by
  exact And.intro Ev.youngModulusPositive (And.intro Ev.poissonRatioRange (And.intro Ev.shearModulusPositive Ev.bulkModulusPositive))

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse