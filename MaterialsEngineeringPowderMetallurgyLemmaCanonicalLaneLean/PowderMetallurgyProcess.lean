import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure PowderCharacterization where
  particleSizeDistribution : Prop
  morphology : String
  apparentDensity : ℝ
  flowability : Prop

structure SinteringKinetics where
  diffusionCoefficient : ℝ
  activationEnergy : ℝ
  sinteringTemperature : ℝ
  densificationRate : Prop

structure PowderMetallurgyProcessPackage where
  powderCharacterization : PowderCharacterization
  sinteringKinetics : SinteringKinetics
  compactionValid : Prop
  sinteringValid : Prop
  finalDensity : ℝ

structure PowderMetallurgyProcessEvidence (P : PowderMetallurgyProcessPackage) where
  compactionValidClosed : P.compactionValid
  sinteringValidClosed : P.sinteringValid
  finalDensityClosed : P.finalDensity > 0

def PowderMetallurgyProcessClosed (P : PowderMetallurgyProcessPackage) : Prop :=
  P.compactionValid ∧ P.sinteringValid ∧ P.finalDensity > 0

theorem powder_metallurgy_process_closed_from_evidence (P : PowderMetallurgyProcessPackage) (E : PowderMetallurgyProcessEvidence P) : PowderMetallurgyProcessClosed P := by
  exact And.intro E.compactionValidClosed (And.intro E.sinteringValidClosed E.finalDensityClosed)

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse
