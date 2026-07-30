import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean

structure BravaisLatticePackage where
  latticeVectors : Type u
  unitCellVolume : Prop
  symmetryGroup : Prop
  reciprocalLattice : Prop
  brillouinZone : Prop

structure BravaisLatticeEvidence (B : BravaisLatticePackage) where
  latticeVectorsClosed : B.latticeVectors
  unitCellVolumeClosed : B.unitCellVolume
  symmetryGroupClosed : B.symmetryGroup
  reciprocalLatticeClosed : B.reciprocalLattice
  brillouinZoneClosed : B.brillouinZone

def BravaisLatticeClosed (B : BravaisLatticePackage) : Prop :=
  B.latticeVectors ∧ B.unitCellVolume ∧ B.symmetryGroup ∧ B.reciprocalLattice ∧ B.brillouinZone

theorem bravais_lattice_closed_from_evidence (B : BravaisLatticePackage) (E : BravaisLatticeEvidence B) :
    BravaisLatticeClosed B := by
  exact And.intro E.latticeVectorsClosed (And.intro E.unitCellVolumeClosed (And.intro E.symmetryGroupClosed (And.intro E.reciprocalLatticeClosed E.brillouinZoneClosed)))

end HautevilleHouse.MaterialsEngineeringMetalsAlloysFoundationCanonicalLaneLean
end HautevilleHouse