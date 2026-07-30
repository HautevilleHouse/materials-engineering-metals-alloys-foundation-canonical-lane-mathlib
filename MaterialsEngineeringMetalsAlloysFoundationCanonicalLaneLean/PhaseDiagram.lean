import canonicalLaneMathlib.AdmissibleClass

/-!
# Phase Diagram Package

This module defines binary phase diagrams, including eutectic and peritectic
reactions common in metal alloys.
-/

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure PhaseDiagramPackage where
  components : String × String
  liquidusCurve : Float → Float
  solidusCurve : Float → Float
  eutecticTemperature : Float
  eutecticComposition : Float

def LiquidusTemperature (P : PhaseDiagramPackage) (x : Float) : Float :=
  P.liquidusCurve x

def SolidusTemperature (P : PhaseDiagramPackage) (x : Float) : Float :=
  P.solidusCurve x

def EutecticReaction (P : PhaseDiagramPackage) : Prop :=
  P.eutecticTemperature > 0 ∧ P.eutecticComposition > 0 ∧ P.eutecticComposition < 1

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  EutecticReaction P ∧
  (∀ x, x ≥ 0 → x ≤ 1 → LiquidusTemperature P x ≥ SolidusTemperature P x)

theorem phase_diagram_well_formed (P : PhaseDiagramPackage)
    (hEutectic : EutecticReaction P) (hLiquidusAboveSolidus : ∀ x, x ≥ 0 → x ≤ 1 →
      LiquidusTemperature P x ≥ SolidusTemperature P x) : PhaseDiagramClosed P :=
  And.intro hEutectic hLiquidusAboveSolidus

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse
