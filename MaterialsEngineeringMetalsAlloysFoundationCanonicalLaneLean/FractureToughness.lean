import canonicalLaneMathlib.AdmissibleClass

/-!
# Fracture Toughness Package

This module defines fracture toughness for metallic materials under linear
elastic fracture mechanics (LEFM).
-/

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure FractureToughnessPackage where
  criticalStressIntensity : Float
  crackLength : Float
  specimenWidth : Float
  yieldStrength : Float

def PlaneStrainCondition (F : FractureToughnessPackage) : Prop :=
  F.specimenWidth ≥ 2.5 * (F.criticalStressIntensity / F.yieldStrength)^2

def FractureToughnessClosed (F : FractureToughnessPackage) : Prop :=
  F.criticalStressIntensity > 0 ∧ F.crackLength > 0 ∧
  F.specimenWidth > 0 ∧ F.yieldStrength > 0 ∧
  PlaneStrainCondition F

theorem fracture_toughness_valid (F : FractureToughnessPackage)
    (hKic : F.criticalStressIntensity > 0) (hCrack : F.crackLength > 0)
    (hWidth : F.specimenWidth > 0) (hYield : F.yieldStrength > 0)
    (hPlaneStrain : PlaneStrainCondition F) : FractureToughnessClosed F :=
  And.intro hKic (And.intro hCrack (And.intro hWidth (And.intro hYield hPlaneStrain)))

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse
