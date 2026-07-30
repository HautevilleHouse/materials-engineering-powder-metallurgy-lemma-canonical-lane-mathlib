import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure PowderCharacterizationPackage where
  particleSizeDistribution : Type u
  morphologyDescriptor : Type v
  apparentDensity : Prop
  tapDensity : Prop
  flowRate : Prop
  compressibility : Prop

structure PowderCharacterizationEvidence (P : PowderCharacterizationPackage) where
  apparentDensityClosed : P.apparentDensity
  tapDensityClosed : P.tapDensity
  flowRateClosed : P.flowRate
  compressibilityClosed : P.compressibility

def PowderCharacterizationClosed (P : PowderCharacterizationPackage) : Prop :=
  P.apparentDensity ∧ P.tapDensity ∧ P.flowRate ∧ P.compressibility

theorem powder_characterization_closed_from_evidence (P : PowderCharacterizationPackage) (E : PowderCharacterizationEvidence P) :
    PowderCharacterizationClosed P := by
  exact And.intro E.apparentDensityClosed
    (And.intro E.tapDensityClosed
      (And.intro E.flowRateClosed E.compressibilityClosed))

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse