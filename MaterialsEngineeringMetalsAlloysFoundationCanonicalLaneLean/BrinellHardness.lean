import canonicalLaneMathlib.AdmissibleClass

/-!
# Brinell Hardness Package

This module defines the Brinell hardness test, a standard indentation-based
measure of hardness for metals and alloys.
-/

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure BrinellHardnessPackage where
  indenterDiameter : Float
  appliedLoad : Float
  indentationDiameter : Float
  testCondition : Prop

structure BrinellHardnessEvidence (B : BrinellHardnessPackage) where
  indenterDiameterPositive : B.indenterDiameter > 0
  appliedLoadPositive : B.appliedLoad > 0
  indentationDiameterLessThanIndenter : B.indentationDiameter < B.indenterDiameter

def BrinellHardnessNumber (B : BrinellHardnessPackage) : Float :=
  let D := B.indenterDiameter
  let P := B.appliedLoad
  let d := B.indentationDiameter
  (2 * P) / (Float.pi * D * (D - Float.sqrt (D*D - d*d)))

def BrinellHardnessClosed (B : BrinellHardnessPackage) : Prop :=
  B.testCondition ∧ BrinellHardnessNumber B > 0

theorem brinell_hardness_positive (B : BrinellHardnessPackage)
    (E : BrinellHardnessEvidence B) : BrinellHardnessNumber B > 0 := by
  unfold BrinellHardnessNumber
  have hDpos : B.indenterDiameter > 0 := E.indenterDiameterPositive
  have hPpos : B.appliedLoad > 0 := E.appliedLoadPositive
  have hpos : B.indentationDiameter < B.indenterDiameter := E.indentationDiameterLessThanIndenter
  nlinarith

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse
