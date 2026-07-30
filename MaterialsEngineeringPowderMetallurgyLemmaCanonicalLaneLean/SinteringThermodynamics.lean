import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean

structure SinteringThermodynamicsPackage where
  temperature : Float
  surfaceEnergy : Float
  diffusionCoeff : Float
  shrinkageRate : Float

structure SinteringThermodynamicsEvidence (P : SinteringThermodynamicsPackage) where
  tempPositive : P.temperature > 0.0
  surfaceEnergyPositive : P.surfaceEnergy > 0.0
  diffusionPositive : P.diffusionCoeff > 0.0
  shrinkageRatePositive : P.shrinkageRate > 0.0

def SinteringThermodynamicsClosed (P : SinteringThermodynamicsPackage) : Prop :=
  P.temperature > 0.0 ∧ P.surfaceEnergy > 0.0 ∧ P.diffusionCoeff > 0.0 ∧ P.shrinkageRate > 0.0

theorem sintering_thermodynamics_closed_from_evidence
    (P : SinteringThermodynamicsPackage) (E : SinteringThermodynamicsEvidence P) :
    SinteringThermodynamicsClosed P := by
  exact And.intro E.tempPositive (And.intro E.surfaceEnergyPositive (And.intro E.diffusionPositive E.shrinkageRatePositive))

end MaterialsEngineeringPowderMetallurgyLemmaCanonicalLaneLean
end HautevilleHouse