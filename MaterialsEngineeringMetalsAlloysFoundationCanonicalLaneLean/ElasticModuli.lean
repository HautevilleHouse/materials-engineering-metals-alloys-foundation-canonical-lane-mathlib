import canonicalLaneMathlib.AdmissibleClass

/-!
# Elastic Moduli Package

This module defines Young's modulus, shear modulus, and Poisson's ratio for
isotropic metallic materials.
-/

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure ElasticModuliPackage where
  youngModulus : Float
  shearModulus : Float
  poissonRatio : Float

def BulkModulus (E : ElasticModuliPackage) : Float :=
  E.youngModulus / (3 * (1 - 2 * E.poissonRatio))

def ElasticModuliClosed (E : ElasticModuliPackage) : Prop :=
  E.youngModulus > 0 ∧ E.shearModulus > 0 ∧
  E.poissonRatio > 0 ∧ E.poissonRatio < 0.5 ∧
  E.youngModulus = 2 * E.shearModulus * (1 + E.poissonRatio)

theorem elastic_moduli_consistency (E : ElasticModuliPackage)
    (hYoung : E.youngModulus > 0) (hShear : E.shearModulus > 0)
    (hPoisson : E.poissonRatio > 0) (hPoissonUpper : E.poissonRatio < 0.5)
    (hRelation : E.youngModulus = 2 * E.shearModulus * (1 + E.poissonRatio)) :
    ElasticModuliClosed E :=
  And.intro hYoung (And.intro hShear (And.intro hPoisson (And.intro hPoissonUpper hRelation)))

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse
