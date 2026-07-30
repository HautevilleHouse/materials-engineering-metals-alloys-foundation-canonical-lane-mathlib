import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure CrystallographyLatticePackage where
  bravaisLattice : Type u
  latticeVectors : List (bravaisLattice × bravaisLattice)
  reciprocalVectors : List (bravaisLattice × bravaisLattice)
  symmetryGroup : Type v
  spaceGroupOperations : Prop
  wyckoffPositions : Prop
  braggCondition : Prop

structure CrystallographyLatticeEvidence (C : CrystallographyLatticePackage) where
  symmetryGroupClosed : C.symmetryGroup
  spaceGroupOperationsClosed : C.spaceGroupOperations
  wyckoffPositionsClosed : C.wyckoffPositions
  braggConditionClosed : C.braggCondition

def CrystallographyLatticeClosed (C : CrystallographyLatticePackage) : Prop :=
  C.symmetryGroup ∧ C.spaceGroupOperations ∧ C.wyckoffPositions ∧ C.braggCondition

theorem crystallography_lattice_closed_from_evidence
    (C : CrystallographyLatticePackage) (E : CrystallographyLatticeEvidence C) :
    CrystallographyLatticeClosed C := by
  exact And.intro E.symmetryGroupClosed
    (And.intro E.spaceGroupOperationsClosed
      (And.intro E.wyckoffPositionsClosed E.braggConditionClosed))

end MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse