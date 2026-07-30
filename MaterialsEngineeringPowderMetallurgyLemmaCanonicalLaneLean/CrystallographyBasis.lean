import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure CrystallographicLattice where
  basisVectors : Type u
  unitCellVolume : Prop
  bravaisType : String
  symmetryGroup : Type v
  latticeParameters : Prop
  latticeParametersTerm : latticeParameters

structure CrystallographyBasisPackage where
  unitCellDefined : Prop
  bravaisLatticeType : Prop
  reciprocalVectors : Prop
  millerIndices : Prop
  xrayDiffractionPattern : Prop

structure CrystallographyBasisEvidence (C : CrystallographyBasisPackage) where
  unitCellDefinedClosed : C.unitCellDefined
  bravaisLatticeTypeClosed : C.bravaisLatticeType
  reciprocalVectorsClosed : C.reciprocalVectors
  millerIndicesClosed : C.millerIndices
  xrayDiffractionPatternClosed : C.xrayDiffractionPattern

def CrystallographyBasisClosed (C : CrystallographyBasisPackage) : Prop :=
  C.unitCellDefined ∧ C.bravaisLatticeType ∧ C.reciprocalVectors ∧ C.millerIndices ∧ C.xrayDiffractionPattern

theorem crystallography_basis_closed_from_evidence (C : CrystallographyBasisPackage) (E : CrystallographyBasisEvidence C) : CrystallographyBasisClosed C := by
  exact And.intro E.unitCellDefinedClosed (And.intro E.bravaisLatticeTypeClosed (And.intro E.reciprocalVectorsClosed (And.intro E.millerIndicesClosed E.xrayDiffractionPatternClosed)))

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse
