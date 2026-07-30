import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure UnitCell where
  latticeVectors : Type u
  basisAtomPositions : Type v
  latticeParameters : Type w
  symmetryGroup : Type x

structure CrystalSystem where
  unitCell : UnitCell
  bravaisLatticeType : Prop
  spaceGroup : Prop
  closePackingCharacterization : Prop
  fillingFraction : ℝ

structure CrystalStructureEvidence (C : CrystalSystem) where
  bravaisLatticeTypeClosed : C.bravaisLatticeType
  spaceGroupClosed : C.spaceGroup
  closePackingCharacterizationClosed : C.closePackingCharacterization

def CrystalStructureClosed (C : CrystalSystem) : Prop :=
  C.bravaisLatticeType ∧ C.spaceGroup ∧ C.closePackingCharacterization

theorem crystal_structure_closed_from_evidence (C : CrystalSystem) (E : CrystalStructureEvidence C) : CrystalStructureClosed C :=
  by
    exact And.intro E.bravaisLatticeTypeClosed (And.intro E.spaceGroupClosed E.closePackingCharacterizationClosed)

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse