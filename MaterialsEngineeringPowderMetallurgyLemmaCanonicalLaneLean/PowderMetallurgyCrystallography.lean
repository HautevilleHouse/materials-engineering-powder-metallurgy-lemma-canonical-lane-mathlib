import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure CrystallographyPackage where
  crystalLattice : Type u
  bravaisLattice : Type v
  unitCell : Type w
  latticeParameters : Prop
  symmetryGroup : Prop
  powderDiffractionPattern : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  latticeParametersClosed : C.latticeParameters
  symmetryGroupClosed : C.symmetryGroup
  powderDiffractionPatternClosed : C.powderDiffractionPattern

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.latticeParameters ∧ C.symmetryGroup ∧ C.powderDiffractionPattern

theorem crystallography_closed_from_evidence (C : CrystallographyPackage) (E : CrystallographyEvidence C) :
    CrystallographyClosed C := by
  exact And.intro E.latticeParametersClosed (And.intro E.symmetryGroupClosed E.powderDiffractionPatternClosed)

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse