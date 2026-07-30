import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure CrystallographyLatticePackage where
  latticeType : Type u
  bravaisLattice : Type v
  unitCell : Type w
  symmetryGroup : Prop
  latticeParameters : Prop
  atomicPositions : Prop

structure CrystallographyLatticeEvidence (C : CrystallographyLatticePackage) where
  symmetryGroupClosed : C.symmetryGroup
  latticeParametersClosed : C.latticeParameters
  atomicPositionsClosed : C.atomicPositions

def CrystallographyLatticeClosed (C : CrystallographyLatticePackage) : Prop :=
  C.symmetryGroup ∧ C.latticeParameters ∧ C.atomicPositions

theorem crystallography_lattice_closed_from_evidence
    (C : CrystallographyLatticePackage) (E : CrystallographyLatticeEvidence C) :
    CrystallographyLatticeClosed C := by
  exact And.intro E.symmetryGroupClosed (And.intro E.latticeParametersClosed E.atomicPositionsClosed)

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse
