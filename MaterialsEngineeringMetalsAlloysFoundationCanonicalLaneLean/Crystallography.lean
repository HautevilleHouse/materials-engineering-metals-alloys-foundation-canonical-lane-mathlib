import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure CrystallographyPackage where
  bravaisLattice : Type
  unitCell : Type
  symmetryGroup : Type
  structureFactor : Prop
  xrayDiffraction : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  bravaisLatticeClosed : C.bravaisLattice
  unitCellClosed : C.unitCell
  symmetryGroupClosed : C.symmetryGroup
  structureFactorClosed : C.structureFactor
  xrayDiffractionClosed : C.xrayDiffraction

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.bravaisLattice ∧ C.unitCell ∧ C.symmetryGroup ∧ C.structureFactor ∧ C.xrayDiffraction

theorem crystallography_closed_from_evidence (C : CrystallographyPackage)
    (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.bravaisLatticeClosed (And.intro E.unitCellClosed
    (And.intro E.symmetryGroupClosed (And.intro E.structureFactorClosed E.xrayDiffractionClosed)))

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse
