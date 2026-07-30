import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure CrystallographyPackage where
  bravaisLattice : Type u
  unitCell : Type v
  crystalSystem : Prop
  pointGroup : Prop
  spaceGroup : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  crystalSystemClosed : C.crystalSystem
  pointGroupClosed : C.pointGroup
  spaceGroupClosed : C.spaceGroup

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.crystalSystem ∧ C.pointGroup ∧ C.spaceGroup

theorem crystallography_closed_from_evidence (C : CrystallographyPackage)
    (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.crystalSystemClosed (And.intro E.pointGroupClosed E.spaceGroupClosed)

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse